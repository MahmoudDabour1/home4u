import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theming/app_assets.dart';
import '../../../../../core/theming/app_strings.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/utils/spacing.dart';
import '../../../../../core/widgets/app_custom_button.dart';
import '../../../widgets/other_auth_button.dart';
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
            onPressed: () {},
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
          btnWidth: 400.w,
        ),
        verticalSpace(16),
        OtherAuthButton(
            image: AppAssets.google,
            text:AppStrings.continueWithGoogle,
            onPressed: () {}
        ),
        verticalSpace(16),
        OtherAuthButton(
          image: AppAssets.facebook,
          text: AppStrings.continueWithFacebook,
          onPressed: () {},
        ),
        verticalSpace(16),
        DontHaveAnAccountText(),
      ],
    );
  }
}
