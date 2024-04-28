import 'package:frontend/model/course.dart';
import 'package:frontend/model/division.dart';
import 'package:frontend/model/lecture_slot.dart';
import 'package:frontend/model/teacher.dart';
import 'package:http/http.dart' as http;

import '../../model/room.dart';

class ResourceAPIService {
  static Future<Map<String, String>> postLectureSlots(
      LectureSlot lectureSlot) async {
    try {
      final res = await http.post(
        Uri.parse('http://127.0.0.1:8000/resources/lecture-slot/'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: lectureSlot.toJson(),
      );
      if (res.statusCode == 201) {
        return {'message': "Successful"};
      }
      return {'error': "An Internal Server Error Occurred"};
    } catch (e) {
      return {'error': e.toString()};
    }
  }

  static Future<Map<String, String>> postCourse(Course course) async {
    try {
      final res = await http.post(
        Uri.parse('http://127.0.0.1:8000/resources/course/'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: course.toJson(),
      );
      if (res.statusCode == 201) {
        return {'message': "Successful"};
      }
      return {'error': "An Internal Server Error Occurred"};
    } catch (e) {
      return {'error': e.toString()};
    }
  }

  static Future<Map<String, String>> postDivision(Division division) async {
    try {
      final res = await http.post(
        Uri.parse('http://127.0.0.1:8000/resources/division/'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: division.toJson(),
      );
      if (res.statusCode == 201) {
        return {'message': "Successful"};
      }
      return {'error': "An Internal Server Error Occurred"};
    } catch (e) {
      return {'error': e.toString()};
    }
  }

  static Future<Map<String, String>> postRoom(Room room) async {
    try {
      final res = await http.post(
        Uri.parse('http://127.0.0.1:8000/resources/room/'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: room.toJson(),
      );
      if (res.statusCode == 201) {
        return {'message': "Successful"};
      }
      return {'error': "An Internal Server Error Occurred"};
    } catch (e) {
      return {'error': e.toString()};
    }
  }

  static Future<Map<String, String>> postTeacher(Teacher teacher) async {
    try {
      final res = await http.post(
        Uri.parse('http://127.0.0.1:8000/resources/teacher/'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: teacher.toJson(),
      );
      if (res.statusCode == 201) {
        return {'message': "Successful"};
      }
      return {'error': "An Internal Server Error Occurred"};
    } catch (e) {
      return {'error': e.toString()};
    }
  }
}
