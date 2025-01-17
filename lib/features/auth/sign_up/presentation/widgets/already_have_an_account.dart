import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:home4u/core/extensions/navigation_extension.dart';

import '../../../../../core/routing/routes.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../../locale/app_locale.dart';

class AlreadyHaveAnAccount extends StatelessWidget {
  const AlreadyHaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(children: [
        TextSpan(
          text: AppLocale.alreadyHaveAnAccount.getString(context),
          style: AppStyles.font16DarkBlueLight,
        ),
        TextSpan(
          text: AppLocale.accessYourAccount.getString(context),
          style: AppStyles.font16DarkBlueBold,
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              context.pushNamed(Routes.loginScreen);
            },
        ),
      ]),
      textAlign: TextAlign.center,
    );
  }
}
