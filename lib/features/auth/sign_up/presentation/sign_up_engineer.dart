import 'package:flutter/material.dart';

class SignUpEngineer extends StatelessWidget {
  const SignUpEngineer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AuthWelcomeData(
                headText: AppStrings.engineerInfo,
                subText: AppStrings.welcomeBack,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
