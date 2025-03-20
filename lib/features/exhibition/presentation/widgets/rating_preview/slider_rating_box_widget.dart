import 'package:auto_size_text/auto_size_text.dart';
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
    double fullWidth = MediaQuery
        .sizeOf(context)
        .width * 0.49;
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: AutoSizeText(
              starNumber,
              style: AppStyles.font16BlackLight,
            ),
          ),
          SizedBox(width: 4.w),
          Expanded(
            flex: 3,
            child: Stack(
              children: [
                Container(
                  width: fullWidth,
                  height: 16.h,
                  decoration: BoxDecoration(
                    color: AppColors.ratingNotFilledColor,
                    borderRadius: BorderRadius
                        .circular(16)
                        .r,
                  ),
                ),
                Container(
                  width: fullWidth * progress,
                  height: 16.h,
                  decoration: BoxDecoration(
                    color: AppColors.ratingColor,
                    borderRadius: BorderRadius
                        .circular(16)
                        .r,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 8.w),
          Expanded(
            flex: 1,
            child: AutoSizeText(
              "$starPercentage%",
              style: AppStyles.font16BlackMedium,
            ),
          ),
        ],
      ),
    );
  }
}