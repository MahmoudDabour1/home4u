import 'package:flutter/material.dart';
import 'package:home4u/features/auth/verification/presentation/widgets/verification_bloc_listener.dart';
import 'package:home4u/features/auth/verification/presentation/widgets/verification_body.dart';

import '../../../../core/theming/app_strings.dart';
import '../../widgets/auth_welcome_data.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AuthWelcomeData(
                headText: AppStrings.verification,
                subText: AppStrings.pleaseVerifyYourAccount,
              ),
              VerificationBody(),
              VerificationBlocListener(),
            ],
          ),
        ),
      ),
    );
  }
}
