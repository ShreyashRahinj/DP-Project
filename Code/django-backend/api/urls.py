from django.urls import path
from .views import *
app_name = "api"
urlpatterns = [
    path('lecture-slot/', create_list_lecture_slot_view),
    path('room/', create_list_room_view),
    path('teacher/', create_list_teacher_view),
    path('course/', create_list_course_view),
    path('division/', create_list_division_view),   
]