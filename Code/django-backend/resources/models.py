from django.db import models

class Department(models.Model):
    name = models.CharField(max_length = 128)

class RoomCategory(models.Model):
    name = models.CharField(max_length = 64,unique=True,primary_key=True)
    max_capacity = models.IntegerField()

class Room(models.Model):
    room_id = models.CharField(max_length = 64,unique=True,primary_key=True)
    category = models.ForeignKey(RoomCategory,on_delete=models.CASCADE)
    department = models.ForeignKey(Department,on_delete=models.CASCADE)

    def __str__(self):
        return self.name

class Course(models.Model):
    course_id = models.CharField(max_length = 64,unique=True,primary_key=True)
    name = models.CharField(max_length = 128)
    department = models.ForeignKey(Department,on_delete=models.CASCADE)
    category = models.ForeignKey(RoomCategory,on_delete=models.CASCADE)

class Teacher(models.Model):
    name = models.CharField(max_length=256)
    department = models.ForeignKey(Department,on_delete=models.CASCADE)
    courses = models.ManyToManyField(Course,related_name="courses", blank=True)

class LectureSlot(models.Model):
    startTime = models.TimeField()
    endTime = models.TimeField()