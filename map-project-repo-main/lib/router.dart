import 'package:flutter/material.dart';

import 'screens/login/login_screen.dart';
import 'screens/participant/main/main_screen.dart';
import 'screens/participant/sport_detail/sport_details_screen.dart';

Route<dynamic> createRoute(settings) {
  switch (settings.name) {
    case '/':
    case '/main':
      return MainScreen.route();

    case '/login':
      return LoginScreen.route();

    case '/sportdetail':
      return SportDetailScreen.route();
  }
  return null;
}
