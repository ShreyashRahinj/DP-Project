from django.db import models

# class RoomCategory(models.Model):
#     name = models.CharField(max_length = 64,unique=True,primary_key=True)
#     max_capacity = models.IntegerField()

class Room(models.Model):
    room_id = models.CharField(max_length = 64,unique=True,primary_key=True)
    max_capacity = models.IntegerField()

    def __str__(self):
        return self.room_id
    
class LectureSlot(models.Model):
    id = models.CharField(max_length=64,unique=True,primary_key=True)
    day = models.CharField(max_length = 32)
    startTime = models.TimeField()
    endTime = models.TimeField()

    def __str__(self):
        return f"{self.day} {self.startTime} - {self.endTime}"

class Teacher(models.Model):
    id = models.CharField(max_length=64,unique=True,primary_key=True)
    name = models.CharField(max_length=256)
    def __str__(self):
        return self.name

class Course(models.Model):
    course_id = models.CharField(max_length = 64,unique=True,primary_key=True)
    name = models.CharField(max_length = 128)
    lectures = models.IntegerField()
    capacity = models.IntegerField()

    def __str__(self):
        return self.name

class Division(models.Model):
    name = models.CharField(max_length = 32)
    teacher = models.ForeignKey(Teacher,on_delete=models.CASCADE)
    course = models.ForeignKey(Course,on_delete=models.CASCADE)

    def __str__(self):
        return self.name

class Class(models.Model):
    division = models.ForeignKey(Division,on_delete=models.CASCADE)
    course = models.ForeignKey(Course,on_delete=models.CASCADE)
    teacher = models.ForeignKey(Teacher,on_delete=models.CASCADE)
    room = models.ForeignKey(Room,on_delete=models.CASCADE)
    slot = models.ForeignKey(LectureSlot,on_delete=models.CASCADE)