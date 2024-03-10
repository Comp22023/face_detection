from pathlib import Path
from deepface import DeepFace
# import face_recognition
# from PIL import Image

# image_path = Path("let.jpg")
# df = DeepFace.analyze(img_path=image_path, actions=['age', 'gender', 'race'], enforce_detection=False)
# print(df[0]['age'])
# print(df[0]['dominant_gender'])
# print(df[0]['dominant_race'])

# count = 0
# img = f"let.jpg"
# faces = face_recognition.load_image_file(img)
# faces_locations = face_recognition.face_locations(faces)
#
# for face_location in faces_locations:
#     top, right, bottom, left = face_location
#
#     face_img = faces[top-30:bottom + 30, left-20:right + 20]
#     pil_img = Image.fromarray(face_img)
#     pil_img.save(f"{count}_{img}")
#     count += 1

# Загрузка модели VGG-Face
# vggface_model = DeepFace.build_model('VGG-Face')
#
# # Путь к изображению
# img_path = "2024-02-18_151516.png"
#
# # Выполнение анализа лица с использованием модели VGG-Face
# result = DeepFace.analyze(img_path, detector_backend='ssd', enforce_detection=False)
#
# # Вывод результата
# print("dominant_emotion:", result[0]["dominant_emotion"])
# print("dominant_gender:", result[0]["dominant_gender"])
# print("dominant_race:", result[0]["dominant_race"])
# print("Age:", result[0]["age"])

# Для прямоугольника вокруг лица
# import face_recognition
# from PIL import Image, ImageDraw
#
#
# def face_rec():
#     gal_face_img = face_recognition.load_image_file("Katya.jpg")
#     gal_face_location = face_recognition.face_locations(gal_face_img)
#
#     pil_img1 = Image.fromarray(gal_face_img)
#     draw1 = ImageDraw.Draw(pil_img1)
#
#     for (top, right, bottom, left) in gal_face_location:
#         draw1.rectangle(((left, top), (right, bottom)), outline=(255, 255, 0), width=4)
#
#     del draw1
#     pil_img1.save("new_gal1.jpg")
#
#
# face_rec()

# import cv2
# import dlib
# import face_recognition
# import numpy as np
#
# # Загрузите модель dlib shape predictor
# shape_predictor_path = "shape_predictor_68_face_landmarks.dat"
# detector = dlib.get_frontal_face_detector()
# predictor = dlib.shape_predictor(shape_predictor_path)
#
# # Загрузите модель для оценки возраста
# age_model_path = "age_deploy.prototxt"
# age_weights_path = "age_net.caffemodel"
# age_net = cv2.dnn.readNetFromCaffe(age_model_path, age_weights_path)
#
#
# def estimate_age(image_path):
#     img = cv2.imread(image_path)
#     rgb_img = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
#
#     # Обнаружение лица
#     dets = detector(rgb_img, 0)
#
#     if len(dets) == 0:
#         print("No face detected.")
#         return
#
#     # Получение вектора признаков лица
#     shape = predictor(rgb_img, dets[0])
#     face_features = face_recognition.face_encodings(rgb_img, [shape_to_np(shape)])[0]
#
#     # Нормализация и изменение размера изображения для ввода в модель
#     blob = cv2.dnn.blobFromImage(img, 1.0, (227, 227), (78.4263377603, 87.7689143744, 114.895847746), swapRB=False)
#     age_net.setInput(blob)
#
#     # Получение оценки возраста
#     outputs = age_net.forward()
#     age = outputs[0, 0, :, :].argmax()
#     age_list = ['(0-2)', '(4-6)', '(8-12)', '(15-20)', '(25-32)', '(38-43)', '(48-53)', '(60-100)']
#     estimated_age = age_list[age]
#
#     print(f"Estimated age: {estimated_age}")
#
#
# def shape_to_np(shape, dtype="int"):
#     coords = np.zeros((68, 2), dtype=dtype)
#     for i in range(0, 68):
#         coords[i] = (shape.part(i).x, shape.part(i).y)
#     return coords
#
#
# # Оцените возраст по фотографии
# estimate_age("let_2.jpg")


import face_recognition
import cv2
import numpy as np

# This is a demo of running face recognition on live video from your webcam. It's a little more complicated than the
# other example, but it includes some basic performance tweaks to make things run a lot faster:
#   1. Process each video frame at 1/4 resolution (though still display it at full resolution)
#   2. Only detect faces in every other frame of video.

# PLEASE NOTE: This example requires OpenCV (the `cv2` library) to be installed only to read from your webcam.
# OpenCV is *not* required to use the face_recognition library. It's only required if you want to run this
# specific demo. If you have trouble installing it, try any of the other demos that don't require it instead.

# Get a reference to webcam #0 (the default one)
video_capture = cv2.VideoCapture(0)

# Load a sample picture and learn how to recognize it.
ya_image = face_recognition.load_image_file("Toretto.png")
ya_face_encoding = face_recognition.face_encodings(ya_image)[0]

# Load a second sample picture and learn how to recognize it.
biden_image = face_recognition.load_image_file("biden.png")
biden_face_encoding = face_recognition.face_encodings(biden_image)[0]

# Create arrays of known face encodings and their names
known_face_encodings = [
    ya_face_encoding,
    biden_face_encoding
]
known_face_names = [
    "Марк",
    "Байден"
]

# Initialize some variables
face_locations = []
face_encodings = []
face_names = []
process_this_frame = True

while True:
    # Grab a single frame of video
    ret, frame = video_capture.read()

    # Only process every other frame of video to save time
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

    # Display the resulting image
    cv2.imshow('Video', frame)

    # Hit 'q' on the keyboard to quit!
    if cv2.waitKey(1) & 0xFF == ord('q'):
        break

# Release handle to the webcam
video_capture.release()
cv2.destroyAllWindows()
