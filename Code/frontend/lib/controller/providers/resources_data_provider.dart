import 'package:flutter/material.dart';
import 'package:frontend/model/course.dart';
import 'package:frontend/model/division.dart';
import 'package:frontend/model/lecture_slot.dart';
import 'package:frontend/model/room.dart';
import 'package:frontend/model/teacher.dart';

class ResourcesDataProvider extends ChangeNotifier {
  List<LectureSlot> lectureSlots = [];
  List<Room> rooms = [];
  List<Teacher> teachers = [];
  List<Course> courses = [];
  List<Division> divisions = [];

  void addLectureSlots({
    required String id,
    required String day,
    required String startTime,
    required String endTime,
  }) {
    lectureSlots.add(
      LectureSlot(
        id: id,
        day: day,
        startTime: startTime,
        endTime: endTime,
      ),
    );
  }

  void addRoom({
    required String id,
    required int capacity,
  }) {
    rooms.add(
      Room(
        id: id,
        capacity: capacity,
      ),
    );
  }

  void addTeacher({
    required String id,
    required String name,
  }) {
    teachers.add(
      Teacher(
        id: id,
        name: name,
      ),
    );
  }

  void addCourse({
    required String id,
    required String name,
    required int lectureNo,
    required int capacity,
  }) {
    courses.add(
      Course(
        id: id,
        name: name,
        lectureNo: lectureNo,
        capacity: capacity,
      ),
    );
  }

  void addDivision({
    required String name,
    required Teacher teacher,
    required Course course,
  }) {
    divisions.add(
      Division(
        name: name,
        teacher: teacher,
        course: course,
      ),
    );
  }
}
