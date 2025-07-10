import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/theming/app_colors.dart';

class OrderContainerLoadingWidget extends StatelessWidget {
  const OrderContainerLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        margin: EdgeInsets.symmetric(vertical: 8.h),
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(color: AppColors.blackColor.withAlpha(25)),
          boxShadow: [
            BoxShadow(
              color: AppColors.blackColor.withAlpha(25),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Order ID and Date
            Row(
              children: [
                Container(width: 100.w, height: 20.h, color: Colors.white),
                const Spacer(),
                Container(width: 80.w, height: 20.h, color: Colors.white),
              ],
            ),
            SizedBox(height: 24.h),

            // Tracking Number
            Container(width: 180.w, height: 20.h, color: Colors.white),
            SizedBox(height: 16.h),

            // Quantity and Subtotal
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(width: 80.w, height: 20.h, color: Colors.white),
                Container(width: 80.w, height: 20.h, color: Colors.white),
              ],
            ),
            SizedBox(height: 16.h),

            // Status and Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(width: 80.w, height: 20.h, color: Colors.white),
                Container(width: 100.w, height: 35.h, color: Colors.white),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
