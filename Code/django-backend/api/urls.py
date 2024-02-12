from django.urls import path
from .views import CreateLectureSlotView
app_name = "api"
urlpatterns = [
    path('lecture-slot/create/', CreateLectureSlotView),
]