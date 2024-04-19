import 'dart:convert';

import 'course.dart';

import 'teacher.dart';

class Division {
  final String name;
  final Teacher teacher;
  final Course course;

  Division({
    required this.name,
    required this.teacher,
    required this.course,
  });

  String toJson() {
    return jsonEncode({
      "name": name,
      "teacher": teacher.id,
      "course": course.id,
    });
  }
}
