import 'package:flutter/material.dart';
import 'package:home4u/core/theming/app_strings.dart';
import 'package:home4u/features/auth/sign_up/presentation/widgets/engineer/sign_up_info.dart';

import '../../widgets/auth_welcome_data.dart';

class EngineerSignUp extends StatelessWidget {
  const EngineerSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AuthWelcomeData(
                headText: AppStrings.engineerInfo,
                subText: AppStrings.welcomeToHome4You,
                isBackButton: true,
              ),
              SignUpInfo(),
            ],
          ),
        ),
      ),
    );
  }
}
