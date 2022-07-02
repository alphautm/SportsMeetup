import 'package:flutter/material.dart';
import 'package:porcupine_project/screens/signup/signup_screen.dart';
import '../screens/login/login_screen.dart';
import '../screens/participant/main/main_screen.dart';

Route<dynamic> createRoute(settings) {
  switch (settings.name) {
    case '/main':
      return MainScreen.route();
    case '/':
    case '/login':
      return LoginScreen.route();
    case '/signup':
      return SignupScreen.route();
  }
  return null;
}
