import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/theming/app_styles.dart';

import '../../../../../core/theming/app_strings.dart';
import '../../../../../core/utils/spacing.dart';
import '../../../../../core/widgets/app_custom_button.dart';
import '../../../widgets/google_and_facebook_auth_buttons.dart';
import 'already_have_an_account.dart';

class SignUpButtons extends StatelessWidget {
  const SignUpButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          AppCustomButton(
            textButton: AppStrings.signUp,
            onPressed: () {},
            btnHeight: 65.h,
            btnWidth: MediaQuery.sizeOf(context).width,
          ),
          verticalSpace(16),
          Text(
            AppStrings.orContinueWith,
            style: AppStyles.font16DarkBlueBold,
          ),
          GoogleAndFacebookAuthButtons(
            onPressedFacebook: () {},
            onPressedGoogle: () {},
          ),
          AlreadyHaveAnAccount(),
          verticalSpace(32),
        ],
      ),
    );
  }
}
