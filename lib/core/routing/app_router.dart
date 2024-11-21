import 'package:flutter/material.dart';
import 'package:home4u/core/routing/routes.dart';

class AppRouter{
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case Routes.onBoardingScreen:
      //   return MaterialPageRoute(
      //      builder: (_) => OnBoardingScreen(),
      //   );
      default:
        return null;
    }
    return null;
  }
}