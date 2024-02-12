from rest_framework.serializers import ModelSerializer
from resources.models import LectureSlot

class LectureSlotSerializer(ModelSerializer):
    class Meta:
        model = LectureSlot
        fields = '__all__'