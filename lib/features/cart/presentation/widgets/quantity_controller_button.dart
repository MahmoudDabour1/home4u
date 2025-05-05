import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_styles.dart';

class QuantityControllerButton extends StatefulWidget {
  const QuantityControllerButton({super.key});

  @override
  State<QuantityControllerButton> createState() =>
      _QuantityControllerButtonState();
}

class _QuantityControllerButtonState extends State<QuantityControllerButton> {
  int itemCount = 0;

  @override
  Widget build(BuildContext context) {
    if (itemCount == 0) {
      return IconButton(
        onPressed: () {
          setState(() {
            itemCount = 1;
          });
        },
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(
            AppColors.primaryColor,
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32.r),
            ),
          ),
        ),
        icon: Icon(
          Icons.add,
          color: AppColors.whiteColor,
          size: 24.w,
        ),
      );
    } else {
      return SizedBox(
        height: 50.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  if (itemCount > 1) {
                    itemCount--;
                  } else {
                    itemCount = 0;
                  }
                });
              },
              borderRadius: BorderRadius.circular(4.r),
              child: Padding(
                padding: EdgeInsets.all(4.w),
                child: Icon(
                  Icons.remove,
                  size: 18.w,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
            SizedBox(width: 4.w),
            Text(
              '$itemCount',
              style: AppStyles.font16BlackMedium,
            ),
            SizedBox(width: 4.w),
            InkWell(
              onTap: () {
                setState(() {
                  itemCount++;
                });
              },
              borderRadius: BorderRadius.circular(4.r),
              child: Padding(
                padding: EdgeInsets.all(4.w),
                child: Icon(
                  Icons.add,
                  size: 18.w,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}
