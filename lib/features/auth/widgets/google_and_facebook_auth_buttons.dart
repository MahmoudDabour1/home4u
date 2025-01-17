import 'package:flutter/cupertino.dart';
import 'package:flutter_localization/flutter_localization.dart';

import '../../../core/theming/app_assets.dart';
import '../../../core/utils/spacing.dart';
import '../../../locale/app_locale.dart';
import 'other_auth_button.dart';

class GoogleAndFacebookAuthButtons extends StatelessWidget {
  final VoidCallback onPressedGoogle;
  final VoidCallback onPressedFacebook;

  const GoogleAndFacebookAuthButtons(
      {super.key,
      required this.onPressedGoogle,
      required this.onPressedFacebook});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(16),
        OtherAuthButton(
            image: AppAssets.google,
            text: AppLocale.continueWithGoogle.getString(context),
            onPressed: onPressedGoogle),
        verticalSpace(16),
        OtherAuthButton(
          image: AppAssets.facebook,
          text: AppLocale.continueWithFacebook.getString(context),
          onPressed: onPressedFacebook,
        ),
        verticalSpace(16),
      ],
    );
  }
}
