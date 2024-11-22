import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/theming/app_assets.dart';
import 'package:home4u/core/theming/app_strings.dart';
import 'package:home4u/core/utils/spacing.dart';
import 'package:home4u/features/auth/widgets/auth_image_and_text_widget.dart';
import 'package:home4u/features/auth/login/presentation/widgets/login_buttons.dart';
import 'package:home4u/features/auth/login/presentation/widgets/phone_and_password.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AuthImageAndTextWidget(
              image: AppAssets.loginImage,
              text: AppStrings.login,
              subText: AppStrings.welcomeBack,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                children: [
                  verticalSpace(12),
                  PhoneAndPassword(),
                  LoginButtons(),
                ],
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              Text(
                "Login",
              ),
              PhoneAndPassword(),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "forget password",
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
