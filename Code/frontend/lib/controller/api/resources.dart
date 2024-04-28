import 'package:frontend/model/course.dart';
import 'package:frontend/model/division.dart';
import 'package:frontend/model/lecture_slot.dart';
import 'package:frontend/model/teacher.dart';
import 'package:http/http.dart' as http;

import '../../model/room.dart';

class ResourceAPIService {
  Future<String> saveAllData({
    required List<LectureSlot> lectureSlots,
    required List<Room> rooms,
    required List<Teacher> teachers,
    required List<Course> courses,
    required List<Division> divisions,
  }) async {
    for (LectureSlot slot in lectureSlots) {
      String res = await postLectureSlots(slot);
      if (res != "Successful") return res;
    }
    for (Room room in rooms) {
      String res = await postRoom(room);
      if (res != "Successful") return res;
    }
    for (Teacher teacher in teachers) {
      String res = await postTeacher(teacher);
      if (res != "Successful") return res;
    }
    for (Course course in courses) {
      String res = await postCourse(course);
      if (res != "Successful") return res;
    }
    for (Division division in divisions) {
      String res = await postDivision(division);
      if (res != "Successful") return res;
    }
    return "Successful";
  }

  Future<String> postLectureSlots(LectureSlot lectureSlot) async {
    try {
      final res = await http.post(
        Uri.parse('http://127.0.0.1:8000/resources/lecture-slot/'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: lectureSlot.toJson(),
      );
      if (res.statusCode == 201) {
        return "Successful";
      }
      return 'An internal error occurred';
    } catch (e) {
      return e.toString();
    }
  }

  Future<String> postCourse(Course course) async {
    try {
      final res = await http.post(
        Uri.parse('http://127.0.0.1:8000/resources/course/'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: course.toJson(),
      );
      if (res.statusCode == 201) {
        return "Successful";
      }
      return 'An internal error occurred';
    } catch (e) {
      return e.toString();
    }
  }

  Future<String> postDivision(Division division) async {
    try {
      final res = await http.post(
        Uri.parse('http://127.0.0.1:8000/resources/division/'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: division.toJson(),
      );
      if (res.statusCode == 201) {
        return "Successful";
      }
      return 'An internal error occurred';
    } catch (e) {
      return e.toString();
    }
  }

  Future<String> postRoom(Room room) async {
    try {
      final res = await http.post(
        Uri.parse('http://127.0.0.1:8000/resources/room/'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: room.toJson(),
      );
      if (res.statusCode == 201) {
        return "Successful";
      }
      return 'An internal error occurred';
    } catch (e) {
      return e.toString();
    }
  }

  Future<String> postTeacher(Teacher teacher) async {
    try {
      final res = await http.post(
        Uri.parse('http://127.0.0.1:8000/resources/teacher/'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: teacher.toJson(),
      );
      if (res.statusCode == 201) {
        return "Successful";
      }
      return 'An internal error occurred';
    } catch (e) {
      return e.toString();
    }
  }
}
