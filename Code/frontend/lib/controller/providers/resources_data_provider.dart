import 'package:flutter/material.dart';
import 'package:frontend/model/course.dart';
import 'package:frontend/model/division.dart';
import 'package:frontend/model/lecture_slot.dart';
import 'package:frontend/model/room.dart';
import 'package:frontend/model/teacher.dart';
import 'package:frontend/view/constants/enums.dart';

import '../api/resources.dart';

class ResourcesDataProvider extends ChangeNotifier {
  List<LectureSlot> lectureSlots = [];
  List<Room> rooms = [];
  List<Teacher> teachers = [];
  List<Course> courses = [];
  List<Division> divisions = [];
  SaveState saveState = SaveState.unsaved;
  String? saveException;

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

  Future<void> saveAllData() async {
    saveState = SaveState.saving;
    saveException = null;
    notifyListeners();
    for (LectureSlot slot in lectureSlots) {
      Map<String, String> res = await ResourceAPIService.postLectureSlots(slot);
      if (res['error'] != null) {
        saveState = SaveState.exception;
        saveException = res['error'];
        notifyListeners();
        return;
      }
    }
    for (Room room in rooms) {
      Map<String, String> res = await ResourceAPIService.postRoom(room);
      if (res['error'] != null) {
        saveState = SaveState.exception;
        saveException = res['error'];
        notifyListeners();
        return;
      }
    }
    for (Teacher teacher in teachers) {
      Map<String, String> res = await ResourceAPIService.postTeacher(teacher);
      if (res['error'] != null) {
        saveState = SaveState.exception;
        saveException = res['error'];
        notifyListeners();
        return;
      }
    }
    for (Course course in courses) {
      Map<String, String> res = await ResourceAPIService.postCourse(course);
      if (res['error'] != null) {
        saveState = SaveState.exception;
        saveException = res['error'];
        notifyListeners();
        return;
      }
    }
    for (Division division in divisions) {
      Map<String, String> res = await ResourceAPIService.postDivision(division);
      if (res['error'] != null) {
        saveState = SaveState.exception;
        saveException = res['error'];
        notifyListeners();
        return;
      }
    }
    saveState = SaveState.saved;
    saveException = null;
    notifyListeners();
  }
}
