import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home4u/core/routing/routes.dart';
import 'package:home4u/features/auth/engineering_office/presentation/engineering_office_screen.dart';
import 'package:home4u/features/auth/forget_password/presentation/forget_password_screen.dart';
import 'package:home4u/features/auth/login/logic/login_cubit.dart';
import 'package:home4u/features/auth/new_password/logic/new_password_cubit.dart';
import 'package:home4u/features/auth/new_password/presentation/new_password_screen.dart';
import 'package:home4u/features/auth/sign_up/logic/engineer/engineer_cubit.dart';
import 'package:home4u/features/auth/sign_up/logic/technical_worker/technical_worker_cubit.dart';
import 'package:home4u/features/auth/sign_up/presentation/engineer_sign_up.dart';
import 'package:home4u/features/auth/sign_up/presentation/sign_up_screen.dart';
import 'package:home4u/features/auth/sign_up/presentation/technical_worker_sign_up.dart';
import 'package:home4u/features/auth/verification/logic/verification_cubit.dart';
import 'package:home4u/features/auth/verification/presentation/verification_screen.dart';
import 'package:home4u/features/home/presentation/home_screen.dart';
import 'package:home4u/features/layout/logic/bottom_nav_cubit.dart';
import 'package:home4u/features/profile/presentation/add_certification_screen.dart';

import '../../features/auth/login/presentation/login_screen.dart';
import '../../features/exhibition/presentation/business_overview_screen.dart';
import '../../features/exhibition/presentation/business_review_screen.dart';
import '../../features/exhibition/presentation/product_preview_screen.dart';
import '../../features/layout/presentation/bottom_nav_bar_layout.dart';
import '../../features/onboarding/presentation/onboarding_screen.dart';
import '../../features/profile/data/models/certifications/get_certifications_response_model.dart';
import '../../features/profile/data/models/projects/get_projects_response_model.dart';
import '../../features/profile/presentation/add_project_screen.dart';
import '../../features/profile/presentation/edit_profile_screen.dart';
import '../../features/profile/presentation/profile_screen.dart';
import '../../features/profile/presentation/project_details_screen.dart';
import '../../features/settings/presentation/setting_screen.dart';
import '../di/dependency_injection.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
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
          builder: (_) => BlocProvider(
            create: (context) => sl<VerificationCubit>(),
            child: VerificationScreen(),
          ),
        );
      case Routes.newPasswordScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => sl<NewPasswordCubit>(),
            child: NewPasswordScreen(),
          ),
        );
      case Routes.engineerSignUpScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<EngineerCubit>(
            create: (_) => sl<EngineerCubit>(),
            child: EngineerSignUp(),
          ),
        );
      case Routes.technicalWorkerSignUpScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<TechnicalWorkerCubit>(
            create: (_) => sl<TechnicalWorkerCubit>(),
            child: TechnicalWorkerSignUp(),
          ),
        );
      case Routes.addProjectScreen:
        final projectData = settings.arguments as ProjectsData?;
        return MaterialPageRoute(
          builder: (_) => AddProjectScreen(
            projectData: projectData,
          ),
        );
      case Routes.engineeringOfficeScreen:
        return MaterialPageRoute(
          builder: (_) => EngineeringOfficeScreen(),
        );
      case Routes.profileScreen:
        return MaterialPageRoute(
          builder: (_) => ProfileScreen(),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => HomeScreen(),
        );
      case Routes.bottomNavLayout:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<BottomNavCubit>(
            create: (_) => BottomNavCubit(),
            child: BottomNavBarLayout(),
          ),
        );
      case Routes.settingScreen:
        return MaterialPageRoute(
          builder: (_) => SettingScreen(),
        );
      case Routes.addCertificationScreen:
        final certificationData = settings.arguments as CertificationsData?;
        return MaterialPageRoute(
          builder: (_) => AddCertificationScreen(
            certificationsData: certificationData,
          ),
        );
      case Routes.projectDetailsScreen:
        int projectId = settings.arguments as int;
        return MaterialPageRoute(
          builder: (_) => ProjectDetailsScreen(projectId: projectId),
        );

      case Routes.editProfileScreen:
        return MaterialPageRoute(
          builder: (_) => EditProfileScreen(),
        );
      case Routes.businessOverviewScreen:
        return MaterialPageRoute(
          builder: (_) => BusinessOverviewScreen(),
        );
      case Routes.businessReviewScreen:
        return MaterialPageRoute(
          builder: (_) => BusinessReviewScreen(),
        );
        case Routes.productPreviewScreen:
          return MaterialPageRoute(
            builder: (_) => ProductPreviewScreen(),
          );
      default:
        return null;
    }
  }
}
