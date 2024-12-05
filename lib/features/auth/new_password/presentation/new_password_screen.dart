import 'package:flutter/material.dart';
import 'package:home4u/core/theming/app_strings.dart';
import 'package:home4u/core/utils/spacing.dart';
import 'package:home4u/features/auth/new_password/presentation/widgets/new_password_bloc_listener.dart';
import 'package:home4u/features/auth/new_password/presentation/widgets/new_password_button.dart';
import 'package:home4u/features/auth/new_password/presentation/widgets/new_password_inputs.dart';

import '../../widgets/auth_welcome_data.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AuthWelcomeData(
                headText: AppStrings.newPassword,
                subText: AppStrings.enterYourNewPassword,
              ),
              verticalSpace(32),
              NewPasswordInputs(),
              NewPasswordButton(),
              NewPasswordBlocListener(),
            ],
          ),
        ),
      ),
    );
  }
}
