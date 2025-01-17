import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:home4u/features/auth/verification/presentation/widgets/verification_bloc_listener.dart';
import 'package:home4u/features/auth/verification/presentation/widgets/verification_body.dart';

import '../../../../locale/app_locale.dart';
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
                headText: AppLocale.verification.getString(context),
                subText: AppLocale.pleaseVerifyYourAccount.getString(context),
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
