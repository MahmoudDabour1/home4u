import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';


class SliderRatingBoxWidget extends StatelessWidget {
  final double progress;
  final String starNumber;
  final int starPercentage;

  const SliderRatingBoxWidget({
    super.key,
    required this.progress,
    required this.starNumber,
    required this.starPercentage,
  });

  @override
  Widget build(BuildContext context) {
    double fullWidth = 195.w;
    return Row(
      spacing: 16.w,
      children: [
        Text(
          starNumber,
          style: AppStyles.font16BlackLight,
        ),
        Stack(
          children: [
            Container(
              width: fullWidth,
              height: 16.h,
              decoration: BoxDecoration(
                color: AppColors.ratingNotFilledColor,
                borderRadius: BorderRadius.circular(16).r,
              ),
            ),
            Container(
              width: fullWidth * progress,
              height: 16.h,
              decoration: BoxDecoration(
                color: AppColors.ratingColor,
                borderRadius: BorderRadius.circular(16).r,
              ),
            ),
          ],
        ),
        Text(
          "$starPercentage%",
          style: AppStyles.font16BlackMedium,
        ),
      ],
    );
  }
}
