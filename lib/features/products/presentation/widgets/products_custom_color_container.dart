import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/utils/spacing.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_styles.dart';

class ProductsCustomColorContainer extends StatelessWidget {
  final Color color;
  const ProductsCustomColorContainer({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 14.r,
      foregroundColor: Colors.transparent,
      backgroundColor: color,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14.r),
          border: Border.all(
            color: AppColors.blackColor,
            width: 1.w,
          ),
        ),
      ),
    );
  }
}
