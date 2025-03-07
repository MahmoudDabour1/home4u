import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_styles.dart';

class ProductsCustomColorContainer extends StatelessWidget {
  final String text;
  const ProductsCustomColorContainer({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45.w,
      height: 29.h,
      decoration: BoxDecoration(
        color: AppColors.containersColor,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Center(
        child: Text(
          text,
          style: AppStyles.font14BlackLight,
        ),
      ),
    );
  }
}
