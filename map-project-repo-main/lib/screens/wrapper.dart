import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:porcupine_project/screens/participant/main/main_screen.dart';
import 'package:porcupine_project/screens/login/login_screen.dart';
import '../models/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    // return either the Home or Authenticate widget
    if (user == null) {
      return LoginScreen();
    } else {
      return MainScreen();
    }
  }
}
