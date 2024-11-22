import 'package:flutter/material.dart';
import 'package:home4u/core/theming/app_assets.dart';
import 'package:home4u/core/theming/app_strings.dart';
import 'package:home4u/core/utils/spacing.dart';
import 'package:home4u/features/auth/sign_up/presentation/widgets/sign_up_buttons.dart';
import 'package:home4u/features/auth/sign_up/presentation/widgets/sign_up_inputs.dart';

import '../../widgets/auth_image_and_text_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AuthImageAndTextWidget(
                image: AppAssets.signUpImage,
                text: AppStrings.signUp,
                subText: AppStrings.welcomeBack,
                isBackButton: true,
              ),
              SignUpInputs(),
              verticalSpace(32),
              SignUpButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
