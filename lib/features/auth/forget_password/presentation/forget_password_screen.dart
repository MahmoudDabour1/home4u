import 'package:flutter/material.dart';
import 'package:home4u/core/theming/app_strings.dart';
import 'package:home4u/features/auth/forget_password/presentation/widgets/forget_password_bloc_listener.dart';
import 'package:home4u/features/auth/forget_password/presentation/widgets/forget_password_body.dart';
import 'package:home4u/features/auth/widgets/auth_welcome_data.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            AuthWelcomeData(
              headText: AppStrings.forgetPasswordK,
              subText: AppStrings.enterYourEmailAddress,
            ),
            ForgetPasswordBody(),
            ForgetPasswordBlocListener(),
          ],
        ),
      )),
    );
  }
}
