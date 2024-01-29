import 'package:frontend/controller/api/server_auth.dart';
import 'package:frontend/model/user.dart';
import 'package:frontend/view/constants/enums.dart';

class AuthStateProvider {
  AuthState authState = AuthState.loggedOut;
  User? user;

  Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    authState = AuthState.loading;
    Map<String, dynamic> res = await ServerAuth.loginUser(
      email: email,
      password: password,
    );
    user = User(
      username: res['username'],
      email: res['email'],
      password: res['password'],
    );
    authState = AuthState.loggedIn;
  }

  Future<void> registerUser({
    required String username,
    required String email,
    required String password,
  }) async {
    authState = AuthState.loading;
    Map<String, dynamic> res = await ServerAuth.registerUser(
      username: username,
      email: email,
      password: password,
    );
    user = User(
      username: res['username'],
      email: res['email'],
      password: res['password'],
    );
    authState = AuthState.loggedIn;
  }
}
