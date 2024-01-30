import 'package:flutter/material.dart';
import 'package:frontend/controller/api/server_auth.dart';
import 'package:frontend/model/user.dart';
import 'package:frontend/view/constants/enums.dart';

class AuthStateProvider extends ChangeNotifier {
  AuthState authState = AuthState.loggedOut;
  User? user;
  String? authError;
  bool showLoginScreen = true;

  loginUser({
    required String email,
    required String password,
  }) async {
    authState = AuthState.loading;
    notifyListeners();
    print('login started');
    Map<String, dynamic> res = await ServerAuth.loginUser(
      email: email,
      password: password,
    );
    if (res['message'] == null) {
      user = User(
        username: res['user'][0]['username'],
        email: res['user'][0]['email'],
        password: res['user'][0]['password'],
      );
      authState = AuthState.loggedIn;
    } else {
      authError = res['message'];
      authState = AuthState.exception;
    }
    notifyListeners();
  }

  registerUser({
    required String username,
    required String email,
    required String password,
  }) async {
    authState = AuthState.loading;
    notifyListeners();
    Map<String, dynamic> res = await ServerAuth.registerUser(
      username: username,
      email: email,
      password: password,
    );
    if (res['message'] == null) {
      user = User(
        username: res['user'][0]['username'],
        email: res['user'][0]['email'],
        password: res['user'][0]['password'],
      );
      authState = AuthState.loggedIn;
    } else {
      authError = res['message'];
      authState = AuthState.exception;
    }
    notifyListeners();
  }

  void changeScreen() {
    showLoginScreen = !showLoginScreen;
    notifyListeners();
  }
}
