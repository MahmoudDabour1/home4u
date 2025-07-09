import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/theming/app_colors.dart';
import '../../../../../../core/theming/app_styles.dart';
import '../../../../../../core/utils/spacing.dart';

class RatingBarSingleItem extends StatelessWidget {
  final double star;
  final double percentage;
  final Color barColor;

  const RatingBarSingleItem(
      {super.key,
      required this.star,
      required this.percentage,
      required this.barColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        children: [
          Row(
            children: [
              Text(
                '$star',
                style: AppStyles.font16GrayMedium,
              ),
              Icon(
                Icons.star,
                color: barColor,
                size: 16.r,
              ),
            ],
          ),
          horizontalSpace(8),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5.r),
              child: LinearProgressIndicator(
                value: percentage / 100,
                backgroundColor: AppColors.mediumGrayColor,
                valueColor: AlwaysStoppedAnimation<Color>(barColor),
                minHeight: 10.h,
              ),
            ),
          ),
          horizontalSpace(8),
          Text(
            '$percentage%',
            style: AppStyles.font16BlackMedium,
          ),
        ],
      ),
    );
  }
}
