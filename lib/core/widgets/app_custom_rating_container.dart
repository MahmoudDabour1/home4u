import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/app_colors.dart';
import '../theming/app_styles.dart';
import '../utils/spacing.dart';

class AppCustomRatingContainer extends StatelessWidget {
  final double rating;
  final double reviewCount;
  final bool isDetailsScreen;

  const AppCustomRatingContainer({
    super.key,
    required this.rating,
    required this.reviewCount,
    this.isDetailsScreen = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isDetailsScreen
            ? AppColors.mediumGrayColor
            : AppColors.filledGrayColor,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 8.w, vertical: isDetailsScreen ? 4.h : 2.h),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              rating.toString(),
              style: isDetailsScreen
                  ? AppStyles.font16BlackMedium
                  : AppStyles.font14BlackMedium,
            ),
            Icon(
              Icons.star,
              color: Colors.green,
              size: 20.r,
            ),
            horizontalSpace(4),
            Text(
              "(${reviewCount}k)",
              style: AppStyles.font16GrayLight.copyWith(
                fontSize: isDetailsScreen ? 16.sp : 14.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
