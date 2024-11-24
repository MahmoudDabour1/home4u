import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/routing/routes.dart';
import 'package:home4u/core/utils/spacing.dart';

import '../../../../../core/theming/app_strings.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/widgets/app_custom_button.dart';
import '../../../widgets/google_and_facebook_auth_buttons.dart';
import 'dont_have_an_account_text.dart';

class LoginButtons extends StatelessWidget {
  const LoginButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.forgetPasswordScreen);
            },
            child: Text(
              AppStrings.forgetPassword,
              style: AppStyles.font14DarkBlueBold,
            ),
          ),
        ),
        AppCustomButton(
          textButton: AppStrings.login,
          onPressed: () {},
          btnHeight: 65.h,
          btnWidth: MediaQuery.sizeOf(context).width,
        ),
        GoogleAndFacebookAuthButtons(
          onPressedFacebook: () {},
          onPressedGoogle: () {},
        ),
        DontHaveAnAccountText(),
        verticalSpace(32),
      ],
    );
  }
}
