from django.contrib.auth.views import LoginView
from django.core.exceptions import PermissionDenied
from django.http import HttpResponse, HttpResponseRedirect
from django.shortcuts import render
from django.urls import reverse_lazy, reverse
from .models import *
import face_recognition
from PIL import Image
from pathlib import Path
from deepface import DeepFace
import numpy as np

from .forms import LoginUserForm, RegisterUserForm, FeedbackForm, TrimmingPhotoForm, AgeGenderRaceForm


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
    # for obj in face_user:
    #
    #     image_obj = face_recognition.load_image_file(f'face_app{obj}') # Фото из базы данных
    #     face_encoding_obj = face_recognition.face_encodings(image_obj)[0]
    #
    #     image_user_upload = face_recognition.load_image_file(f'face_app/media/{face_trim}') # Загруженное фото пользователя
    #     face_encoding_user_upload = face_recognition.face_encodings(image_user_upload)[0]
    #
    #     result = face_recognition.compare_faces([face_encoding_obj], face_encoding_user_upload)
    #
    #     if result[0]:
    #         FaceTrimUser.objects.filter(users_id=users_id, face_photo=face_trim).update(name=obj.name, age=obj.age,
    #                                                                                     dominant_gender=obj.dominant_gender,
    #                                                                                     dominant_race=obj.dominant_race,
    #                                                                                     face_encodings=face_encoding_user_upload)
    #         break
    #     else:
    #         FaceTrimUser.objects.filter(users_id=users_id, face_photo=face_trim).update(face_encodings=face_encoding_user_upload)
    image_user_upload = face_recognition.load_image_file(f'face_app/media/{count}_{face_trim}')  # Загруженное фото пользователя
    face_encoding_user_upload = face_recognition.face_encodings(image_user_upload)[0]

    known_face_encodings = []

    for append_known_face_encodings in face_user:  # Добавление кодировок лица в список
        if append_known_face_encodings.face_encodings is None:
            print('none')
            FaceTrimUser.objects.filter(users_id=users_id, face_photo=f"{count}_{face_trim}").update(
                face_encodings=face_encoding_user_upload)
        else:
            face_encoding = np.frombuffer(append_known_face_encodings.face_encodings,
                                          dtype=np.float64)  # Беру из QuerySet face_user, поле append_known_face_encodings.face_encodings
            known_face_encodings.append(face_encoding)

    for compare_faces_known_face_encodings in known_face_encodings:
        result = face_recognition.compare_faces([compare_faces_known_face_encodings],
                                                face_encoding_user_upload)  # Сравнение кодировок лиц из списка с загруженным
        if result[0]:
            for data_face_user in face_user:
                FaceTrimUser.objects.filter(users_id=users_id, face_photo=f"{count}_{face_trim}").update(name=data_face_user.name,
                                                                                            age=data_face_user.age,
                                                                                            dominant_gender=data_face_user.dominant_gender,
                                                                                            dominant_race=data_face_user.dominant_race,
                                                                                            face_encodings=face_encoding_user_upload)
                break
        else:
            # FaceTrimUser.objects.filter(users_id=users_id, face_photo=f"{count}_{face_trim}").update(
            #     face_encodings=face_encoding_user_upload)
            pass


def working_with_images(request, users_id):
    face_user = FaceTrimUser.objects.filter(users_id=users_id).order_by('id')
    # Тест сохранения кодировки лица в бд
    # face_encodings_database = FaceTrimUser.objects.all().values_list('face_encodings', flat=True) # Вывод поля face_encodings из базы данных
    # image_user_upload = face_recognition.load_image_file(f'face_app/media/0_Toretto_2.png')  # Загруженное фото пользователя
    # face_encoding_user_upload = face_recognition.face_encodings(image_user_upload)[0]
    # known_face_encodings = []
    # for append_known_face_encodings in face_user: #Добавление кодировок лица в список
    #     face_encoding = np.frombuffer(append_known_face_encodings.face_encodings, dtype=np.float64) #Беру из QuerySet face_user, поле append_known_face_encodings.face_encodings
    #     known_face_encodings.append(face_encoding)
    #
    # for compare_faces_known_face_encodings in known_face_encodings:
    #     result = face_recognition.compare_faces([compare_faces_known_face_encodings], face_encoding_user_upload) #Сравнение кодировок лиц из списка с загруженным
    #     if result[0]:
    #         print('True')
    #     else:
    #         print('False')

    form1 = TrimmingPhotoForm(request.POST, request.FILES)
    form2 = AgeGenderRaceForm(request.POST)

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
                    # resized_im = pil_img.resize((200, 200))
                    # resized_im.save(f"face_app/media/{count}_{face_trim}")
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
        else:
            form1 = TrimmingPhotoForm()
            form2 = AgeGenderRaceForm()

        data = {
            'face_user': face_user,
            'form1': form1,
            'form2': form2,
        }

        return render(request, 'face_app/working_with_images.html', data)
    else:
        raise PermissionDenied
