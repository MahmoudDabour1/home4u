import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/utils/spacing.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_styles.dart';

class ProductsCustomColorContainer extends StatelessWidget {
  final String text;
  const ProductsCustomColorContainer({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.containersColor,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Center(
            child: Padding(
              padding:  EdgeInsets.all(8.0.w),
              child: Text(
                text,
                style: AppStyles.font14BlackLight,
              ),
            ),
          ),
        ),
        horizontalSpace(8),
      ],
    );
  }
}
