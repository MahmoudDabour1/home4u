import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home4u/core/theming/app_assets.dart';
import 'package:home4u/core/theming/app_colors.dart';
import 'package:home4u/core/theming/app_styles.dart';
import 'package:home4u/core/widgets/app_custom_button.dart';

import '../../../../core/utils/spacing.dart';

class FeedbackSuccessDialog extends StatelessWidget {
  const FeedbackSuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.whiteColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      child: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              AppAssets.successFeedbackSvg,
              width: 80.w,
              height: 80.h,
            ),
            verticalSpace(24.h),
            Text(
              "Thank you for your feedback!",
              style: AppStyles.font16BlackBold,
              textAlign: TextAlign.center,
            ),
            verticalSpace(16.h),
            Text(
              "We appreciated your feedback.\nWe’ll use your feedback to improve your experience.",
              style: TextStyle(
                fontSize: 14.sp,
                color: AppColors.grayColor,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
            verticalSpace(24.h),
            AppCustomButton(
              textButton: "Done",
              btnWidth: MediaQuery.sizeOf(context).width * 0.4,
              btnHeight: 50.h,
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
