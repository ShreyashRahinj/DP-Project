from random import randrange


class Data:
    ROOMS = [['R1', 25], ['R2', 45], ['R3', 35]]
    TEACHERS = [['T1', 'Angela White'],
                ['T2', 'Mia Malkova'],
                ['T3', 'Dani Daniels'],
                ['T4', 'Ava Addams']]
    MEETINGTIMES = [['M1', 'MWF 09:00 - 10:00'],
                    ['M2', 'MWF 10:00 - 11:00'],
                    ['M3', 'TTH 09:00 - 10:30'],
                    ['M4', 'TTH 10:30 - 12:00']]
    SUBJECTS = [['S1', 'Calculus', 25],
                ['S2', 'Algebra', 35],
                ['S3', 'Probablity and Statistics', 25],
                ['S4', 'Data Structures', 30],
                ['S5', 'Operating System', 35],
                ['S6', 'Computer Networks', 45],
                ['S7', 'Machine Learning', 45]]

    DEPTS = ['AI&DS', 'Comp', 'IT']

    def __init__(self):
        self._rooms = []
        self._meetingTimes = []
        self._teachers = []

        for i in range(len(self.ROOMS)):
            self._rooms.append(Room(self.ROOMS[i][0], self.ROOMS[i][1]))

        for i in range(len(self.MEETINGTIMES)):
            self._meetingTimes.append(MeetingTime(self.MEETINGTIMES[i][0], self.MEETINGTIMES[i][1]))

        for i in range(len(self.TEACHERS)):
            self._teachers.append(Teacher(self.TEACHERS[i][0], self.TEACHERS[i][1]))

        sub1 = Subject('S1', 'Artificial Intelligence', [self._teachers[0], self._teachers[1]], 25)
        sub2 = Subject('S2', 'TOC', [self._teachers[0], self._teachers[1], self._teachers[2]], 35)
        sub3 = Subject('S3', 'Cloud Computing', [self._teachers[0], self._teachers[1]], 25)
        sub4 = Subject('S4', 'Data Structures', [self._teachers[2], self._teachers[3]], 30)
        sub5 = Subject('S5', 'Operating System', [self._teachers[3]], 35)
        sub6 = Subject('S6', 'Computer Networks', [self._teachers[0], self._teachers[2]], 45)
        sub7 = Subject('S7', 'Human Values', [self._teachers[1], self._teachers[3]], 45)
        self._subjects = [sub1, sub2, sub3, sub4, sub5, sub6, sub7]

        dept1 = Department('AI&DS', [sub1, sub3])
        dept2 = Department('Comp', [sub2, sub4, sub5])
        dept3 = Department('IT', [sub6, sub7])
        self._depts = [dept1, dept2, dept3]

        self._numOfClasses = 0
        for i in range(len(self._depts)):
            self._numOfClasses += len(self._depts[i].get_subjects())

    def get_rooms(self):
        return self._rooms

    def get_meetingTimes(self):
        return self._meetingTimes

    def get_teachers(self):
        return self._teachers

    def get_subjects(self):
        return self._subjects

    def get_depts(self):
        return self._depts

    def get_numOfClasses(self):
        return self._numOfClasses


class Subject:
    def __init__(self, id, name, teachers, maxNumOfStudents):
        self._id = id
        self._name = name
        self._teachers = teachers
        self._maxNumOfStudents = maxNumOfStudents

    def get_id(self): return self._id

    def get_name(self): return self._name

    def get_teachers(self): return self._teachers

    def get_maxNumOfStudents(self): return self._maxNumOfStudents

    def __str__(self): return self._name


class Department:
    def __init__(self, name, subjects):
        self._name = name
        self._subjects = subjects

    def get_name(self): return self._name

    def get_subjects(self): return self._subjects


class Teacher:
    def __init__(self, id, name):
        self._id = id
        self._name = name

    def get_id(self): return self._id

    def get_name(self): return self._name


class MeetingTime:
    def __init__(self, id, time):
        self._id = id
        self._time = time

    def get_id(self): return self._id

    def get_time(self): return self._time


class Room:
    def __init__(self, number, seatingCapacity):
        self._number = number
        self._seatingCapacity = seatingCapacity

    def get_number(self): return self._number

    def get_seatingCapacity(self): return self._seatingCapacity


# A class consists of a dept,subject,teacher,room,meeting time
class Class:
    def __init__(self, id, dept, subject):
        self._id = id
        self._dept = dept
        self._subject = subject
        self._teacher = None
        self._room = None
        self._meetingTime = None

    def get_id(self): return self._id

    def get_dept(self): return self._dept

    def get_subject(self): return self._subject

    def get_teacher(self): return self._teacher

    def get_room(self): return self._room

    def get_meetingTime(self): return self._meetingTime

    def set_teacher(self, teacher): self._teacher = teacher

    def set_room(self, room): self._room = room

    def set_meetingTime(self, meetingTime): self._meetingTime = meetingTime

    def __str__(self):
        return f'{self._dept.get_name()},{self._subject.get_id()},{self._room.get_name()},{self._teacher.get_name()},\
                {self._meetingTime.get_time()}'


# Multiple randomly generated classes form a schedule
class Schedule:
    def __init__(self):
        self._data = data
        self._classes = []
        self._numOfConflicts = 0
        self._fitness = -1
        self._classNum = 0
        self._isFitnessChanged = True

    def get_classes(self):
        self._isFitnessChanged = True
        return self._classes

    def get_numOfConflicts(self):
        return self._numOfConflicts

    def get_fitness(self):
        if self._isFitnessChanged:
            self._fitness = self.calculate_fitness()
            self._isFitnessChanged = False
        return self._fitness

    def initialize(self):
        depts = self._data.get_depts()
        for i in range(len(depts)):
            subjects = depts[i].get_subjects()
            for j in range(len(subjects)):
                newClass = Class(self._classNum, depts[i], subjects[j])
                self._classNum += 1
                newClass.set_room(self._data.get_rooms()[randrange(0, len(self._data.get_rooms()))])
                newClass.set_meetingTime(
                    self._data.get_meetingTimes()[randrange(0, len(self._data.get_meetingTimes()))])
                newClass.set_teacher(subjects[j].get_teachers()[randrange(0, len(subjects[j].get_teachers()))])
                self._classes.append(newClass)

        return self

    def calculate_fitness(self):
        self._numOfConflicts = 0
        classes = self.get_classes()

        for i in range(len(classes)):
            if classes[i].get_room().get_seatingCapacity() < classes[i].get_subject().get_maxNumofStudents():
                self._numOfConflicts += 1

            for j in range(i + 1, len(classes)):
                if classes[i].get_meetingTime().get_id() == classes[j].get_meetingTime().get_id():
                    if classes[i].get_room().get_number() == classes[j].get_room().get_number():
                        self._numOfConflicts += 1
                    if classes[i].get_teacher.get_id() == classes[j].get_teacher.get_id():
                        self._numOfConflicts += 1

        return 1 / (1.0 * self._numOfConflicts + 1)


class Population:
    pass


class GeneticAlgorithm:
    pass


data = Data()
