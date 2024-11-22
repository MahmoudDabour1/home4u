import 'package:flutter/material.dart';
import 'package:home4u/core/routing/routes.dart';
import 'package:home4u/features/auth/sign_up/presentation/sign_up_screen.dart';

import '../../features/auth/login/presentation/login_screen.dart';
import '../../features/onboarding/presentation/onboarding_screen.dart';


class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(
           builder: (_) => LoginScreen(),
        );
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => OnBoardingScreen(),
        );
        case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => SignUpScreen(),
        );
      default:
        return null;
    }
    return null;
  }
}