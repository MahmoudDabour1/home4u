import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/theming/app_assets.dart';
import 'package:home4u/core/theming/app_strings.dart';
import 'package:home4u/core/theming/app_styles.dart';
import 'package:home4u/core/utils/spacing.dart';
import 'package:home4u/features/auth/login/presentation/widgets/dont_have_an_account_text.dart';
import 'package:home4u/features/auth/login/presentation/widgets/login_buttons.dart';
import 'package:home4u/features/auth/login/presentation/widgets/phone_and_password.dart';

import '../../../../core/widgets/app_custom_button.dart';
import '../../widgets/auth_image_and_text_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
