import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';

import '../../../../../core/theming/app_styles.dart';
import '../../../../../locale/app_locale.dart';

class CustomSeeAllRowWidget extends StatelessWidget {
  final String text;
 final VoidCallback onPressed;
  const CustomSeeAllRowWidget({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Text(
          text,
          style: AppStyles.font16BlackMedium,
        ),
        Spacer(),
        TextButton(
          onPressed:onPressed,
          child: Text(
            AppLocale.seeAll.getString(context),
            style: AppStyles.font16DarkBlueLight,
          ),
        ),
      ],
    );
  }
}
