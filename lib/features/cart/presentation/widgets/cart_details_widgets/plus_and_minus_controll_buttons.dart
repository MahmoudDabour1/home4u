import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';

class PlusAndMinusControllerButtons extends StatelessWidget {
  final int initialQuantity;
  final Function(int) onQuantityChanged;

  const PlusAndMinusControllerButtons({
    super.key,
    required this.initialQuantity,
    required this.onQuantityChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () => onQuantityChanged(initialQuantity + 1),
          icon: Icon(Icons.add, color: AppColors.primaryColor, size: 24.w),
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
        ),
        Text('$initialQuantity', style: AppStyles.font16BlackMedium),
        IconButton(
          onPressed: () {
            if (initialQuantity > 1) {
              onQuantityChanged(initialQuantity - 1);
            }
          },
          icon: Icon(Icons.remove, color: AppColors.primaryColor, size: 24.w),
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
        ),
      ],
    );
  }
}
