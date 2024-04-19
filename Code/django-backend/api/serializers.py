from rest_framework.serializers import ModelSerializer
from resources.models import LectureSlot,Room,Teacher,Course,Division

class LectureSlotSerializer(ModelSerializer):
    class Meta:
        model = LectureSlot
        fields = '__all__'

class RoomSerializer(ModelSerializer):
    class Meta:
        model = Room
        fields = '__all__'

class TeacherSerializer(ModelSerializer):
    class Meta:
        model = Teacher
        fields = '__all__'
        
class CourseSerializer(ModelSerializer):
    class Meta:
        model = Course
        fields = '__all__'

class DivisionSerializer(ModelSerializer):
    class Meta:
        model = Division
        fields = '__all__'

