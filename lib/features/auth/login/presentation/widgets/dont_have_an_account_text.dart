import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:home4u/core/extensions/navigation_extension.dart';

import '../../../../../core/routing/routes.dart';
import '../../../../../core/theming/app_styles.dart';

class DontHaveAnAccountText extends StatelessWidget {
  const DontHaveAnAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return  RichText(
      text: TextSpan(children: [
        TextSpan(
          text: "Don't have an account? ",
          style: AppStyles.font16DarkBlueLight,
        ),
        TextSpan(
          text: "Create a new account",
          style: AppStyles.font16DarkBlueBold,
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              context.pushNamed(Routes.onBoardingScreen);
            },
        ),
      ]),
      textAlign: TextAlign.center,
    );
  }
}
