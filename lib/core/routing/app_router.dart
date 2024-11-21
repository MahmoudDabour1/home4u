import 'package:flutter/material.dart';
import 'package:home4u/core/routing/routes.dart';

import '../../features/onboarding/presentation/onboarding_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => OnboardingScreen(),
        );
      default:
        return null;
    }
    return null;
  }
}
