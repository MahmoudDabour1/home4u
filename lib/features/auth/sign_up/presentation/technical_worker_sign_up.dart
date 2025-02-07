import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:home4u/features/auth/sign_up/presentation/widgets/technical_worker/technical_worker_sign_up_info.dart';

import '../../../../locale/app_locale.dart';
import '../../widgets/auth_welcome_data.dart';

class TechnicalWorkerSignUp extends StatelessWidget {
  const TechnicalWorkerSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AuthWelcomeData(
                headText: AppLocale.technicalInfo.getString(context),
                subText: AppLocale.welcomeToHome4You.getString(context),
                isBackButton: true,
              ),
              TechnicalWorkerSignUpInfo(),
            ],
          ),
        ),
      ),
    );
  }
}
