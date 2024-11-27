import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/theming/app_strings.dart';
import 'package:home4u/core/utils/spacing.dart';
import 'package:home4u/features/auth/login/presentation/widgets/login_buttons.dart';
import 'package:home4u/features/auth/login/presentation/widgets/phone_and_password.dart';
import 'package:home4u/features/auth/widgets/auth_welcome_data.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AuthWelcomeData(
                headText: AppStrings.login,
                subText: AppStrings.welcomeBack,
                isBackButton: false,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  children: [
                    verticalSpace(32),
                    PhoneAndPassword(),
                    LoginButtons(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
