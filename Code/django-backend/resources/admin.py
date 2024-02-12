from django.contrib import admin

# Register your models here.
from .models import Division,Class,Course,LectureSlot,Room,Teacher

admin.site.register(Division)
admin.site.register(Class)
admin.site.register(Course)
admin.site.register(LectureSlot)
admin.site.register(Room)
admin.site.register(Teacher)