import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/theming/app_styles.dart';
import 'package:home4u/core/utils/spacing.dart';
import 'package:home4u/features/auth/login/presentation/widgets/dont_have_an_account_text.dart';
import 'package:home4u/features/auth/login/presentation/widgets/other_login_button.dart';
import 'package:home4u/features/auth/login/presentation/widgets/phone_and_password.dart';

import '../../../../core/widgets/app_custom_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Image.asset(
                  "assets/images/login_image.png",
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "log in",
                        style: AppStyles.font20BlackBold,
                      ),
                      verticalSpace(12),
                      Text(
                        "Welcome back!",
                        style: AppStyles.font16DarkBlueLight,
                      ),
                      verticalSpace(40),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                children: [
                  verticalSpace(12),
                  PhoneAndPassword(),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "forget password",
                        style: AppStyles.font14DarkBlueBold,
                      ),
                    ),
                  ),
                  AppCustomButton(
                    textButton: "Log in",
                    onPressed: () {},
                    btnHeight: 65.h,
                    btnWidth: 400.w,
                  ),
                  verticalSpace(16),
                  OtherLoginButton(
                    image: "assets/images/google.png",
                    text: "Continue with Google",
                  ),
                  verticalSpace(16),
                  OtherLoginButton(
                    image: "assets/images/facebook.png",
                    text: "Continue with Facebook",
                  ),
                  verticalSpace(16),
                  DontHaveAnAccountText(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
