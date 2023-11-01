from random import randrange, choices, random
from prettytable import PrettyTable
from time import perf_counter

POPULATION_SIZE = 9
NUM_OF_ELITE_SCHEDULES = 1
MUTATION_RATE = 0.1
TOURNAMENT_SELECTION_SIZE = 3


# Initial data which has been hard-coded
class Data:
    ROOMS = [['R1', 25], ['R2', 45], ['R3', 35]]
    TEACHERS = [['T1', 'Prema Kadam'],
                ['T2', 'Santosh Kumar'],
                ['T3', 'Varsha Jadhav'],
                ['T4', 'Vivek Patil']]
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


# Classes for defining the differents components that are required for a Scheduled Class
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
        return f'{self._dept.get_name()},{self._subject.get_id()},{self._room.get_number()},{self._teacher.get_id()},{self._meetingTime.get_id()}'


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
            if classes[i].get_room().get_seatingCapacity() < classes[i].get_subject().get_maxNumOfStudents():
                self._numOfConflicts += 1

            for j in range(i + 1, len(classes)):
                if classes[i].get_meetingTime().get_id() == classes[j].get_meetingTime().get_id():
                    if classes[i].get_room().get_number() == classes[j].get_room().get_number():
                        self._numOfConflicts += 1
                    if classes[i].get_teacher().get_id() == classes[j].get_teacher().get_id():
                        self._numOfConflicts += 1

        return 1 / (1.0 * self._numOfConflicts + 1)

    def __str__(self):
        returnValue = ''
        for i in range(len(self._classes) - 1):
            returnValue += f'{str(self._classes[i])},'
        returnValue += str(self._classes[len(self._classes) - 1])

        return returnValue


# Generate a Population of Schedules
class Population:
    def __init__(self, size):
        self._size = size
        self._data = data
        self._schedules = []
        for i in range(size):
            self._schedules.append(Schedule().initialize())

    def get_schedules(self): return self._schedules


# Display Manager class for managing all the table printing
class DisplayMgr:
    def print_available_data(self):
        print('All Available Data ->')
        self.print_dept()
        self.print_subjects()
        self.print_rooms()
        self.print_teachers()
        self.print_meeting_times()

    def print_dept(self):
        print('Departments:')
        depts = data.get_depts()
        deptsTable = PrettyTable(['Dept', 'Subjects'])
        for i in range(len(depts)):
            subjects = depts[i].get_subjects()
            subjectsStr = ''
            for j in range(len(subjects) - 1):
                subjectsStr += f'{str(subjects[j])}, '
            subjectsStr += str(subjects[len(subjects) - 1])
            deptsTable.add_row([depts[i].get_name(), subjectsStr])
        print(deptsTable)

    def print_subjects(self):
        print('Subjects:')
        subjects = data.get_subjects()
        subjectsTable = PrettyTable(['Id', 'Name', 'Max Number of Students', 'Teachers'])
        for i in range(len(subjects)):
            teachers = subjects[i].get_teachers()
            teachersStr = ''
            for j in range(len(teachers) - 1):
                teachersStr += f'{teachers[j].get_name()}, '
            teachersStr += teachers[len(teachers) - 1].get_name()
            subjectsTable.add_row(
                [subjects[i].get_id(), subjects[i].get_name(), subjects[i].get_maxNumOfStudents(), teachersStr])
        print(subjectsTable)

    def print_rooms(self):
        print('Rooms:')
        rooms = data.get_rooms()
        roomsTable = PrettyTable(['Name', 'Seating Capacity'])
        for i in range(len(rooms)):
            roomsTable.add_row([rooms[i].get_number(), rooms[i].get_seatingCapacity()])
        print(roomsTable)

    def print_teachers(self):
        print('Teachers:')
        teachers = data.get_teachers()
        teachersTable = PrettyTable(['Id', 'Name'])
        for i in range(len(teachers)):
            teachersTable.add_row([teachers[i].get_id(), teachers[i].get_name()])
        print(teachersTable)

    def print_meeting_times(self):
        print('Meeting Times:')
        meetingTimes = data.get_meetingTimes()
        meetingTimesTable = PrettyTable(['Id', 'Time'])
        for i in range(len(meetingTimes)):
            meetingTimesTable.add_row([meetingTimes[i].get_id(), meetingTimes[i].get_time()])
        print(meetingTimesTable)

    def print_generation(self, population):
        generationTable = PrettyTable(
            ['Schedule No.', 'Fitness', 'No of Conflicts', 'Classes(dept,sub,room,teacher,meeting-time)'])
        schedules = population.get_schedules()
        for i in range(len(schedules)):
            classes = schedules[i].get_classes()
            classesStr = ''
            for j in range(len(classes)):
                classesStr += str(classes[j]) + '  '
            generationTable.add_row(
                [i, round(schedules[i].get_fitness(), 3), schedules[i].get_numOfConflicts(), classesStr])
        print(generationTable)

    def print_schedule_as_table(self, schedule):
        classes = schedule.get_classes()
        scheduleTable = PrettyTable(
            ['Class', 'Dept', 'Subject(Id,Max No of Students)', 'Room(Capacity)', 'Teacher(Id)', 'Meeting Time(Id)'])
        for i in range(len(classes)):
            scheduleTable.add_row([classes[i].get_id(),
                                   classes[i].get_dept().get_name(),
                                   f'{classes[i].get_subject().get_name()} ({classes[i].get_subject().get_id()}, {classes[i].get_subject().get_maxNumOfStudents()})',
                                   f'{classes[i].get_room().get_number()} ({classes[i].get_room().get_seatingCapacity()})',
                                   f'{classes[i].get_teacher().get_name()} ({classes[i].get_teacher().get_id()})',
                                   f'{classes[i].get_meetingTime().get_time()} ({classes[i].get_meetingTime().get_id()})'])
        print(scheduleTable)


# Class that contains the functions related to the main algorithm
class GeneticAlgorithm:
    def selection(self, population):
        return choices(
            population=population.get_schedules(),
            weights=[schedule.get_fitness() for schedule in population.get_schedules()],
            k=2
        )

    def tournament_selection(self, population):
        tournament_schedules = []
        for i in range(TOURNAMENT_SELECTION_SIZE):
            tournament_schedules.append(population.get_schedules()[randrange(POPULATION_SIZE)])

        tournament_schedules.sort(key=lambda s: s.get_fitness(), reverse=True)
        return tournament_schedules[0]

    def crossover_schedule(self, schedule1, schedule2):
        new_schedule = Schedule().initialize()
        for i in range(len(new_schedule.get_classes())):
            if random() < 0.5:
                new_schedule.get_classes()[i] = schedule1.get_classes()[i]
            else:
                new_schedule.get_classes()[i] = schedule2.get_classes()[i]
        return new_schedule

    def mutate_schedule(self, schedule):
        random_schedule = Schedule().initialize()
        for i in range(len(schedule.get_classes())):
            if random() < MUTATION_RATE:
                schedule.get_classes()[i] = random_schedule.get_classes()[i]
        return schedule

    def mutate_population(self, population):
        for i in range(NUM_OF_ELITE_SCHEDULES, POPULATION_SIZE):
            self.mutate_schedule(population.get_schedules()[i])
        return population

    def next_generation(self, population):
        next_generation = Population(0)
        for i in range(NUM_OF_ELITE_SCHEDULES):
            next_generation.get_schedules().append(population.get_schedules()[i])

        for i in range(NUM_OF_ELITE_SCHEDULES, POPULATION_SIZE):
            schedule1, schedule2 = self.selection(population)

            # schedule1 = self.tournament_selection(population)
            # schedule2 = self.tournament_selection(population)
            new_schedule = self.crossover_schedule(schedule1, schedule2)
            next_generation.get_schedules().append(new_schedule)

        return next_generation

    def evolve(self, population):
        return self.mutate_population(self.next_generation(population))


data = Data()
displayMgr = DisplayMgr()
displayMgr.print_available_data()
gen = 0
print(f'Generation: {gen}')
population = Population(POPULATION_SIZE)
population.get_schedules().sort(key=lambda s: s.get_fitness(), reverse=True)
displayMgr.print_generation(population)
displayMgr.print_schedule_as_table(population.get_schedules()[0])

start = perf_counter()
while population.get_schedules()[0].get_fitness() != 1.0:
    gen += 1
    print(f'Generation: {gen}')
    population = GeneticAlgorithm().evolve(population)
    population.get_schedules().sort(key=lambda s: s.get_fitness(), reverse=True)
    displayMgr.print_generation(population)
    displayMgr.print_schedule_as_table(population.get_schedules()[0])
    print()

end = perf_counter()
print(f'Time taken: {end - start}')
