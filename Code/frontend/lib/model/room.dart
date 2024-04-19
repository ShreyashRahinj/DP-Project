import 'dart:convert';

class Room {
  final String id;
  final int capacity;

  Room({
    required this.id,
    required this.capacity,
  });

  String toJson() {
    return jsonEncode({
      "room_id": id,
      "max_capacity": capacity,
    });
  }
}
