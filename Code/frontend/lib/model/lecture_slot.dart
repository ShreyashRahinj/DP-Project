import 'dart:convert';

class LectureSlot {
  final String id;
  final String day;
  final String startTime;
  final String endTime;

  LectureSlot({
    required this.id,
    required this.day,
    required this.startTime,
    required this.endTime,
  });

  String toJson() {
    return jsonEncode({
      "id": id,
      "day": day,
      "startTime": startTime,
      "endTime": endTime,
    });
  }
}
