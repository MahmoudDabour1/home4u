import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:home4u/core/theming/app_styles.dart';
import 'package:home4u/locale/app_locale.dart';

import '../../../../../core/widgets/app_custom_add_button.dart';

class AboutTitleAndEditRow extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const AboutTitleAndEditRow(
      {super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: AppStyles.font16BlackMedium,
        ),
        Spacer(),
        AppCustomAddButton(
          text: AppLocale.edit.getString(context),
          onPressed: onPressed,
        ),
      ],
    );
  }
}
