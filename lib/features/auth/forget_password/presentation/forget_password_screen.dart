import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:home4u/features/auth/forget_password/presentation/widgets/forget_password_bloc_listener.dart';
import 'package:home4u/features/auth/forget_password/presentation/widgets/forget_password_body.dart';
import 'package:home4u/features/auth/widgets/auth_welcome_data.dart';

import '../../../../locale/app_locale.dart';

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
                  headText: AppLocale.forgetPasswordK.getString(context),
                  subText: AppLocale.enterYourEmailAddress.getString(context),
                ),
                ForgetPasswordBody(),
                ForgetPasswordBlocListener(),
              ],
            ),
          )),
    );
  }
}
