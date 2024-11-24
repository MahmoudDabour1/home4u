import 'package:flutter/material.dart';
import 'package:home4u/core/theming/app_assets.dart';
import 'package:home4u/core/theming/app_strings.dart';
import 'package:home4u/features/auth/forget_password/presentation/widgets/forget_password_body.dart';
import 'package:home4u/features/auth/widgets/auth_image_and_text_widget.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            AuthImageAndTextWidget(
              image: AppAssets.forgetPasswordImage,
              text: AppStrings.forgetPasswordK,
              subText: AppStrings.enterYourPhoneNumber,
              isBackButton: true,
              horizontalPadding: 18,
            ),
            ForgetPasswordBody(),
          ],
        ),
      )),
    );
  }
}
