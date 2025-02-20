import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:home4u/core/extensions/navigation_extension.dart';
import 'package:home4u/core/routing/routes.dart';
import 'package:home4u/core/utils/spacing.dart';
import 'package:home4u/features/auth/new_password/presentation/widgets/new_password_bloc_listener.dart';
import 'package:home4u/features/auth/new_password/presentation/widgets/new_password_button.dart';
import 'package:home4u/features/auth/new_password/presentation/widgets/new_password_inputs.dart';

import '../../../../locale/app_locale.dart';
import '../../widgets/auth_welcome_data.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                AuthWelcomeData(
                  headText: AppLocale.newPassword.getString(context),
                  subText: AppLocale.enterYourNewPassword.getString(context),
                  onPressed: () {
                    context.pushNameAndRemoveUntil(
                      Routes.loginScreen,
                      predicate: (route) => false,
                    );
                  },
                ),
                verticalSpace(32),
                NewPasswordInputs(),
                NewPasswordButton(),
                NewPasswordBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
