import 'package:flutter/cupertino.dart';

import '../../../core/theming/app_assets.dart';
import '../../../core/theming/app_strings.dart';
import '../../../core/utils/spacing.dart';
import 'other_auth_button.dart';

class GoogleAndFacebookAuthButtons extends StatelessWidget {
  final VoidCallback onPressedGoogle;
  final VoidCallback onPressedFacebook;
  const GoogleAndFacebookAuthButtons({super.key, required this.onPressedGoogle, required this.onPressedFacebook});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(16),
        OtherAuthButton(
            image: AppAssets.google,
            text:AppStrings.continueWithGoogle,
            onPressed: onPressedGoogle
        ),
        verticalSpace(16),
        OtherAuthButton(
          image: AppAssets.facebook,
          text: AppStrings.continueWithFacebook,
          onPressed: onPressedFacebook,
        ),
        verticalSpace(16),
      ],
    );
  }
}
