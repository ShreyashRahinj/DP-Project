from rest_framework import generics

from resources.models import LectureSlot,Room,Teacher,Course,Division
from .serializers import LectureSlotSerializer,RoomSerializer,TeacherSerializer,CourseSerializer,DivisionSerializer

# Create your views here.
class CreateListLectureSlotView(generics.ListCreateAPIView):
    queryset = LectureSlot.objects.all()
    serializer_class = LectureSlotSerializer

class CreateListRoomView(generics.ListCreateAPIView):
    queryset = Room.objects.all()
    serializer_class = RoomSerializer

class CreateListTeacherView(generics.ListCreateAPIView):
    queryset = Teacher.objects.all()
    serializer_class = TeacherSerializer

class CreateListCourseView(generics.ListCreateAPIView):
    queryset = Course.objects.all()
    serializer_class = CourseSerializer

class CreateListDivisionView(generics.ListCreateAPIView):
    queryset = Division.objects.all()
    serializer_class = DivisionSerializer

    def perform_create(self, serializer):
        print(self.request.data)
        queryset = Division.objects.filter(name=self.request.data['name'],teacher=self.request.data['teacher'],course=self.request.data['course'])
        if queryset.exists():
            raise FileExistsError("Already Occupied")
        return super().perform_create(serializer)

create_list_lecture_slot_view = CreateListLectureSlotView.as_view()
create_list_room_view = CreateListRoomView.as_view()
create_list_teacher_view = CreateListTeacherView.as_view()
create_list_course_view = CreateListCourseView.as_view()
create_list_division_view = CreateListDivisionView.as_view()