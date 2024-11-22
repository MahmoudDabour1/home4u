import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/theming/app_colors.dart';

class CustomIndicator extends StatelessWidget {
  final bool active;

  const CustomIndicator({super.key, required this.active});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 250),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100).r,
        color: active ? AppColors.primaryColor : AppColors.grayColor,
      ),
      width: active ? 30.w : 10.w,
      height: 10.h,
    );
  }
}
