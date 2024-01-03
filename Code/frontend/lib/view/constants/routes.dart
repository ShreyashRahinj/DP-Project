import 'package:flutter/material.dart';
import 'package:frontend/view/components/login_dialog.dart';
import 'package:frontend/view/screens/home_screen.dart';

const homeScreenRoute = '/home';
const loginScreenRoute = '/login';

Map<String, WidgetBuilder> routes = {
  homeScreenRoute: (context) => const HomeScreen(),
  loginScreenRoute: (context) => const LoginDialog(),
};
