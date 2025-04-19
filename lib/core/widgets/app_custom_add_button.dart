import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/app_colors.dart';
import '../theming/app_styles.dart';
import '../utils/spacing.dart';

class AppCustomAddButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const AppCustomAddButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: IconButton(
        onPressed: onPressed,
        icon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.add,
              size: 25.r,
              color: AppColors.secondaryColor,
            ),
            horizontalSpace(10),
            Text(
              text,
              style: AppStyles.font16DarkBlueLight,
            ),
          ],
        ),
      ),
    );
  }
}
