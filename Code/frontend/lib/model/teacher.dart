import 'dart:convert';

class Teacher {
  final String id;
  final String name;

  Teacher({
    required this.id,
    required this.name,
  });

  String toJson() {
    return jsonEncode({
      "id": id,
      "name": name,
    });
  }
}
