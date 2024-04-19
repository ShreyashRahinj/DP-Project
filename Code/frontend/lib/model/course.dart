import 'dart:convert';

class Course {
  final String id;
  final String name;
  final int lectureNo;
  final int capacity;

  Course({
    required this.id,
    required this.name,
    required this.lectureNo,
    required this.capacity,
  });

  String toJson() {
    return jsonEncode({
      "course_id": id,
      "name": name,
      "lectures": lectureNo,
      "capacity": capacity,
    });
  }
}
