import 'package:flutter/material.dart';
import 'package:frontend/controller/providers/auth_state_provider.dart';
import 'package:frontend/view/constants/enums.dart';
import 'package:frontend/view/screens/auth/login_or_register_screen.dart';
import 'package:frontend/view/screens/create_timetable_screen.dart';
import 'package:provider/provider.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthStateProvider>(
      builder: (context, value, child) {
        switch (value.authState) {
          case AuthState.loggedOut:
            return const LoginOrRegisterScreen();
          case AuthState.loading:
            return const CircularProgressIndicator();
          case AuthState.loggedIn:
            return const CreateTimetableScreen();
          case AuthState.exception:
            return const CircularProgressIndicator();
        }
      },
    );
  }
}
