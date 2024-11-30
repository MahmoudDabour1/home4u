import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home4u/core/routing/routes.dart';
import 'package:home4u/features/auth/engineering_office/presentation/engineering_office_screen.dart';
import 'package:home4u/features/auth/forget_password/presentation/forget_password_screen.dart';
import 'package:home4u/features/auth/login/logic/login_cubit.dart';
import 'package:home4u/features/auth/new_password/presentation/new_password_screen.dart';
import 'package:home4u/features/auth/sign_up/presentation/sign_up_screen.dart';
import 'package:home4u/features/auth/verification/presentation/verification_screen.dart';

import '../../features/auth/login/presentation/login_screen.dart';
import '../../features/onboarding/presentation/onboarding_screen.dart';
import '../di/dependency_injection.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) =>
              BlocProvider(
                create: (context) => sl<LoginCubit>(),
                child: LoginScreen(),
              ),
        );
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => OnBoardingScreen(),
        );
      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => SignUpScreen(),
        );
      case Routes.forgetPasswordScreen:
        return MaterialPageRoute(
          builder: (_) => ForgetPasswordScreen(),
        );
      case Routes.verificationScreen:
        return MaterialPageRoute(
          builder: (_) => VerificationScreen(),
        );
      case Routes.newPasswordScreen:
        return MaterialPageRoute(
          builder: (_) => NewPasswordScreen(),
        );
      case Routes.engineeringOfficeScreen:
        return MaterialPageRoute(
          builder: (_) => EngineeringOfficeScreen(),
        );
      default:
        return null;
    }
    return null;
  }
}
