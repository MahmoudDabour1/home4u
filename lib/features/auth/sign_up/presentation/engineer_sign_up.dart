import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:home4u/features/auth/sign_up/presentation/widgets/engineer/sign_up_info.dart';

import '../../../../locale/app_locale.dart';
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
                headText: AppLocale.engineerInfo.getString(context),
                subText: AppLocale.welcomeToArchiSpace.getString(context),
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
