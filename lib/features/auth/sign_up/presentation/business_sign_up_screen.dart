import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:home4u/features/auth/sign_up/presentation/widgets/business/business_sign_up_info.dart';
import 'package:home4u/features/auth/sign_up/presentation/widgets/engineer/sign_up_info.dart';

import '../../../../locale/app_locale.dart';
import '../../widgets/auth_welcome_data.dart';

class BusinessSignUpScreen extends StatelessWidget {
  const BusinessSignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AuthWelcomeData(
                headText: AppLocale.businessInfo.getString(context),
                subText: AppLocale.welcomeToHome4You.getString(context),
                isBackButton: true,
              ),
              BusinessSignUpInfo(),
            ],
          ),
        ),
      ),
    );
  }
}
