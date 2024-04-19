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
}
