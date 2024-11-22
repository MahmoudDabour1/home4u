import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/theming/app_styles.dart';
import 'package:home4u/core/utils/spacing.dart';
import 'package:home4u/features/auth/login/presentation/widgets/phone_and_password.dart';

import '../../../../core/widgets/app_back_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              Text(
                "Login",
                style: AppStyles.font20BlackBold,
              ),
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
            ],
          ),
        ),
      ),
    );
  }
}
