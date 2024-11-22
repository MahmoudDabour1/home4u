import 'package:flutter/material.dart';
import 'package:home4u/core/routing/routes.dart';

import '../../features/auth/login/presentation/login_screen.dart';

class AppRouter{
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(
           builder: (_) => LoginScreen(),
        );
      default:
        return null;
    }
    return null;
  }
}