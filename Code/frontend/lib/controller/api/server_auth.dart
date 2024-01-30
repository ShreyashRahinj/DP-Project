import 'dart:convert';

import 'package:frontend/view/constants/urls.dart';
import 'package:http/http.dart' as http;

class ServerAuth {
  static Future<Map<String, dynamic>> registerUser({
    required String username,
    required String email,
    required String password,
  }) async {
    Map<String, dynamic> map = {};
    try {
      final res = await http.post(
        Uri.parse('$authRouteUrl/register'),
        headers: {
          "Access-Control-Allow-Origin": "*",
          'Content-Type': 'application/json',
          'Accept': '*/*'
        },
        body: jsonEncode(
          {
            "username": username,
            "email": email,
            "password": password,
          },
        ),
      );
      if (res.statusCode == 200) {
        map = await loginUser(
          email: email,
          password: password,
        );
      } else {
        map = jsonDecode(res.body);
      }
    } on Exception catch (e) {
      map = {"message": e.toString()};
    }
    return map;
  }

  static Future<Map<String, dynamic>> loginUser({
    required String email,
    required String password,
  }) async {
    Map<String, dynamic> map = {};
    try {
      final res = await http.post(
        Uri.parse('$authRouteUrl/login'),
        headers: {
          "Access-Control-Allow-Origin": "*",
          'Content-Type': 'application/json',
          'Accept': '*/*'
        },
        body: jsonEncode(
          {
            "email": email,
            "password": password,
          },
        ),
      );
      if (res.statusCode == 200) {
        map = jsonDecode(res.body);
      } else {
        map = jsonDecode(res.body);
      }
    } on Exception catch (e) {
      map = {"message": e.toString()};
    }
    return map;
  }
}
