import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';

class PlusAndMinusControllerButtons extends StatefulWidget {
  const PlusAndMinusControllerButtons({super.key});

  @override
  State<PlusAndMinusControllerButtons> createState() =>
      _PlusAndMinusControllerButtonsState();
}

class _PlusAndMinusControllerButtonsState
    extends State<PlusAndMinusControllerButtons> {
  int itemCount = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 12.w,
      children: [
        IconButton(
          onPressed: () {
            setState(() {
              itemCount++;
            });
          },
          icon: Icon(
            Icons.add,
            color: AppColors.primaryColor,
            size: 24.w,
          ),
          padding: EdgeInsets.zero,
          constraints: BoxConstraints(),
        ),
        Text(
          '$itemCount',
          style: AppStyles.font16BlackMedium,
        ),
        IconButton(
          onPressed: () {
            if (itemCount > 1) {
              setState(() {
                itemCount--;
              });
            }
          },
          icon: Icon(
            Icons.remove,
            color: AppColors.primaryColor,
            size: 24.w,
          ),
          padding: EdgeInsets.zero,
          constraints: BoxConstraints(),
        ),
      ],
    );
  }
}
