import 'package:flutter/material.dart';
import 'package:frontend/view/screens/auth/auth_gate.dart';

import 'package:frontend/view/screens/home_screen.dart';

const homeScreenRoute = '/home';
const authGateRoute = '/auth';

Map<String, WidgetBuilder> routes = {
  homeScreenRoute: (context) => const HomeScreen(),
  authGateRoute: (context) => const AuthGate(),
};
