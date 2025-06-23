import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/theming/app_styles.dart';
import 'package:home4u/core/utils/spacing.dart';

class ProductIsRatedBeforeWidget extends StatelessWidget {
  const ProductIsRatedBeforeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey.withValues(alpha: 0.4),
              borderRadius: BorderRadius.circular(8.0).r,
            ),
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Your Feedback",
                      style: AppStyles.font16BlackBold,
                    ),
                    Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Edit Review",
                        style: AppStyles.font16BlackMedium.copyWith(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
                verticalSpace(8),
                Row(
                  spacing: 6.w,
                  children: [
                    Text(
                      "Product Rating",
                      style: AppStyles.font14BlackMedium,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 16.w,
                    ),
                    Text(
                      "4.5",
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                verticalSpace(8),
              ],
            ),
          ),
        ),
        verticalSpace(32),
      ],
    );
  }
}
