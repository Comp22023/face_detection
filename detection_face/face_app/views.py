from django.contrib.auth.views import LoginView
from django.core.exceptions import PermissionDenied
from django.http import HttpResponse, HttpResponseRedirect, JsonResponse
from django.shortcuts import render, get_object_or_404
from django.urls import reverse_lazy, reverse
from .models import *
import face_recognition
from PIL import Image
from pathlib import Path
from deepface import DeepFace
import numpy as np
import cv2
from django.http import StreamingHttpResponse
from django.views.decorators import gzip

import base64
import dlib

from .forms import LoginUserForm, RegisterUserForm, FeedbackForm, TrimmingPhotoForm, AgeGenderRaceForm, UpdateDataPhotoForm, DeletePhotoForm


def index(request):
    if request.method == "POST":
        form = FeedbackForm(request.POST)
        if form.is_valid():
            feedback = form.save(commit=False)  # создание объекта без сохранения в БД
            feedback.save()
    else:
        form = FeedbackForm()

    data = {
        'form': form,
    }
    return render(request, 'face_app/index.html', data)


def page_not_found(request, exception):
    return HttpResponse('<h1>Страница не найдена!</h1>')


class LoginUser(LoginView):
    form_class = LoginUserForm
    template_name = 'face_app/login.html'
    extra_context = {'title': "Авторизация"}

    def get_success_url(self):
        return reverse_lazy('index')


def registration(request):
    if request.method == "POST":
        form = RegisterUserForm(request.POST)
        if form.is_valid():
            user = form.save(commit=False)  # создание объекта без сохранения в БД
            # user.username = compare_faces("face_app/dataset/regina_1.jpg", "face_app/dataset/regina_2.jpg")
            # data = request.POST.get('email', None)
            # print(data)
            user.set_password(form.cleaned_data['password'])
            user.save()
            return render(request, 'face_app/registration_done.html')
    else:
        form = RegisterUserForm()
    return render(request, 'face_app/registration.html', {'form': form})


def extracting_faces(face_user, users_id, count, face_trim):
    image_user_upload = face_recognition.load_image_file(f'face_app/media/{count}_{face_trim}')  # Загруженное фото пользователя
    face_encoding_user_upload = face_recognition.face_encodings(image_user_upload)[0]
    FaceTrimUser.objects.filter(users_id=users_id, face_photo=f"{count}_{face_trim}").update(
        face_encodings=face_encoding_user_upload)

    for data_face_user in face_user:
        face_encoding = np.frombuffer(data_face_user.face_encodings, dtype=np.float64)
        result = face_recognition.compare_faces([face_encoding],
                                                face_encoding_user_upload)  # Сравнение кодировок лиц из базы данных с загруженным
        if result[0]:
            FaceTrimUser.objects.filter(users_id=users_id, face_photo=f"{count}_{face_trim}").update(
                name=data_face_user.name,
                age=data_face_user.age,
                dominant_gender=data_face_user.dominant_gender,
                dominant_race=data_face_user.dominant_race)
            break
        else:
            pass


# face_cascade = cv2.CascadeClassifier(cv2.data.haarcascades + 'haarcascade_frontalface_default.xml')

known_face_encodings = []
known_face_names = []

face_locations = []
face_encodings = []
face_names = []


def gen(camera, users_id):
    face_user = FaceTrimUser.objects.filter(users_id=users_id).order_by('id')
    for data_face_user in face_user:
        face_encoding = np.frombuffer(data_face_user.face_encodings, dtype=np.float64)
        known_face_encodings.append(face_encoding)
        known_face_names.append(data_face_user.name)

    process_this_frame = True
    while True:
        ret, frame = camera.read()
        if not ret:
            break
        else:
            if process_this_frame:
                # Resize frame of video to 1/4 size for faster face recognition processing
                small_frame = cv2.resize(frame, (0, 0), fx=0.25, fy=0.25)

                # Convert the image from BGR color (which OpenCV uses) to RGB color (which face_recognition uses)
                rgb_small_frame = small_frame[:, :, ::-1]

                # Find all the faces and face encodings in the current frame of video
                face_locations = face_recognition.face_locations(rgb_small_frame)
                face_encodings = face_recognition.face_encodings(rgb_small_frame, face_locations)

                face_names = []
                for face_encoding in face_encodings:
                    # See if the face is a match for the known face(s)
                    matches = face_recognition.compare_faces(known_face_encodings, face_encoding)
                    name = "Неизвестно"

                    # Or instead, use the known face with the smallest distance to the new face
                    face_distances = face_recognition.face_distance(known_face_encodings, face_encoding)
                    best_match_index = np.argmin(face_distances)
                    if matches[best_match_index]:
                        name = known_face_names[best_match_index]

                    face_names.append(name)

            process_this_frame = not process_this_frame

            # Display the results
            for (top, right, bottom, left), name in zip(face_locations, face_names):
                # Scale back up face locations since the frame we detected in was scaled to 1/4 size
                top *= 4
                right *= 4
                bottom *= 4
                left *= 4

                # Draw a box around the face
                cv2.rectangle(frame, (left, top), (right, bottom), (0, 0, 255), 2)

                # Draw a label with a name below the face
                cv2.rectangle(frame, (left, bottom - 35), (right, bottom), (0, 0, 255), cv2.FILLED)
                # font = cv2.FONT_HERSHEY_DUPLEX
                font = cv2.FONT_HERSHEY_COMPLEX
                cv2.putText(frame, name, (left + 6, bottom - 6), font, 1.0, (255, 255, 255), 1)
            # Преобразование изображения в оттенки серого
            # gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
            # # Обнаружение лиц на кадре
            # faces = face_cascade.detectMultiScale(gray, 1.3, 5)
            # # Рисование прямоугольников вокруг обнаруженных лиц
            # for (x, y, w, h) in faces:
            #     cv2.rectangle(frame, (x, y), (x + w, y + h), (255, 0, 0), 2)

            # Конвертирование изображения в формат JPEG
            _, jpeg = cv2.imencode('.jpg', frame)
            yield (b'--frame\r\n'
                   b'Content-Type: image/jpeg\r\n\r\n' + jpeg.tobytes() + b'\r\n\r\n')


@gzip.gzip_page
def live_feed(request, users_id):
    try:
        camera = cv2.VideoCapture(0)
    except Exception:
        pass

    return StreamingHttpResponse(gen(camera, users_id), content_type="multipart/x-mixed-replace;boundary=frame")


def working_with_images(request, users_id):
    face_user = FaceTrimUser.objects.filter(users_id=users_id).order_by('id')

    form1 = TrimmingPhotoForm(request.POST, request.FILES)
    form2 = AgeGenderRaceForm(request.POST)
    UpdateDataPhoto = UpdateDataPhotoForm(request.POST)
    DeletePhoto = DeletePhotoForm(request.POST)

    if users_id == request.user.id:
        if request.method == "POST":
            if form1.is_valid():
                face = form1.save(commit=False)  # создание объекта без сохранения в БД

                count = 0
                faces = face_recognition.load_image_file(face.face_photo)
                faces_locations = face_recognition.face_locations(faces)

                face_trim = f"{face.face_photo}"

                for face_location in faces_locations:
                    top, right, bottom, left = face_location

                    face_img = faces[top:bottom, left:right]
                    pil_img = Image.fromarray(face_img)
                    pil_img.save(f"face_app/media/{count}_{face_trim}")
                    face_user_photo = FaceTrimUser(face_photo=f"{count}_{face_trim}", users_id=face.users_id)
                    face_user_photo.save()
                    extracting_faces(face_user, users_id, count, face_trim)
                    count += 1
                url = reverse('working_with_images', args=[users_id])
                return HttpResponseRedirect(url)

            if form2.is_valid():
                path_img = form2.cleaned_data['path']
                image_path = Path(f"face_app/media/{path_img}")
                DeepAnalyze = DeepFace.analyze(img_path=image_path, actions=['age', 'gender', 'race', 'emotion'],
                                               enforce_detection=False)
                ResultDeepAnalyze = DeepAnalyze[0]

                gender_translation = {'Man': 'Мужчина', 'Woman': 'Женщина'}

                race_translation = {'indian': 'Индейцы', 'Asian': 'Азиаты',
                                    'latino hispanic': 'Латиноамериканцы', 'black': 'Африканцы',
                                    'middle eastern': 'Средневосточная', 'white': 'Европейцы'}

                emotion_translation = {'happy': 'Счастье', 'sad': 'Грусть',
                                       'angry': 'Гнев', 'surprise': 'Удивление', 'fear': 'Страх',
                                       'disgust': 'Отвращение', 'neutral': 'Нет эмоций'}

                ResultDeepAnalyze['dominant_gender'] = gender_translation.get(ResultDeepAnalyze['dominant_gender'],
                                                                              ResultDeepAnalyze['dominant_gender'])
                ResultDeepAnalyze['dominant_race'] = race_translation.get(ResultDeepAnalyze['dominant_race'],
                                                                          ResultDeepAnalyze['dominant_race'])
                ResultDeepAnalyze['dominant_emotion'] = emotion_translation.get(ResultDeepAnalyze['dominant_emotion'],
                                                                                ResultDeepAnalyze['dominant_emotion'])

                FaceTrimUser.objects.filter(users_id=users_id, face_photo=path_img).update(age=ResultDeepAnalyze['age'],
                                                                                           dominant_gender=
                                                                                           ResultDeepAnalyze[
                                                                                               'dominant_gender'],
                                                                                           dominant_race=
                                                                                           ResultDeepAnalyze[
                                                                                               'dominant_race'],
                                                                                           dominant_emotion=
                                                                                           ResultDeepAnalyze[
                                                                                               'dominant_emotion'])
            if UpdateDataPhoto.is_valid(): #Сохранение изменений, которые вносит пользователь через форму
                id = UpdateDataPhoto.cleaned_data['id']
                name = UpdateDataPhoto.cleaned_data['name']
                description = UpdateDataPhoto.cleaned_data['description']
                age = UpdateDataPhoto.cleaned_data['age']
                dominant_gender = UpdateDataPhoto.cleaned_data['dominant_gender']
                dominant_race = UpdateDataPhoto.cleaned_data['dominant_race']
                dominant_emotion = UpdateDataPhoto.cleaned_data['dominant_emotion']
                users_id = UpdateDataPhoto.cleaned_data['users_id']

                FaceTrimUser.objects.filter(id=id, users_id=users_id).update(
                    name=name,
                    description=description,
                    age=age,
                    dominant_gender=dominant_gender,
                    dominant_race=dominant_race,
                    dominant_emotion=dominant_emotion)
                url = reverse('working_with_images', args=[users_id])
                return HttpResponseRedirect(url)

            if DeletePhoto.is_valid(): #удаление фото
                id = DeletePhoto.cleaned_data['id']
                FaceTrimUser.objects.filter(id=id, users_id=users_id).delete()
        else:
            form1 = TrimmingPhotoForm()
            form2 = AgeGenderRaceForm()
            UpdateDataPhoto = UpdateDataPhotoForm()

        data = {
            'face_user': face_user,
            'form1': form1,
            'form2': form2,
            'UpdateDataPhotoForm': UpdateDataPhoto,
        }

        return render(request, 'face_app/working_with_images.html', data)
    else:
        raise PermissionDenied


def update_data_photo(request, users_id):
    # if request.method == 'POST':
    #     name = request.POST.get('name')
    #     email = request.POST.get('email')
    #     # Здесь можно добавить код для обновления данных в базе данных
    #     # Например:
    #     # user = User.objects.get(pk=user_id)
    #     # user.name = name
    #     # user.email = email
    #     # user.save()
    #     return JsonResponse({'message': 'Данные успешно обновлены!'})
    # else:
    #     return JsonResponse({'error': 'Метод запроса должен быть POST!'}, status=400)

    # instance = get_object_or_404(FaceTrimUser, pk=pk)
    if request.method == 'POST':
        form = UpdateDataPhotoForm(request.POST)
        if form.is_valid():
            form.save()
            url = reverse('working_with_images', args=[users_id])
            return HttpResponseRedirect(url)
    else:
        form = UpdateDataPhotoForm()
    return render(request, 'face_app/working_with_images.html', {'form': form})
