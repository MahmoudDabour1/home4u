import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/app_colors.dart';
import '../theming/app_styles.dart';

InputDecoration getCommonInputDecoration({
  required String labelText,
  TextStyle? labelStyle,
  Widget? suffixIcon,
  Widget? prefixIcon,
}) {
  return InputDecoration(
    isDense: true,
    filled: true,
    fillColor: AppColors.textFieldFillColor,
    contentPadding: EdgeInsets.symmetric(
      vertical: 17.h,
      horizontal: 20.w,
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.primaryColor, width: 1.3),
      borderRadius: BorderRadius.circular(16.r),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.secondaryColor, width: 1.3),
      borderRadius: BorderRadius.circular(16.r),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.red, width: 1.3),
      borderRadius: BorderRadius.circular(16.r),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.red, width: 1.3),
      borderRadius: BorderRadius.circular(16.r),
    ),
    // hintText: hintText,
    label: Text(
      labelText,
      style: labelStyle ?? AppStyles.font16BlackLight,
    ),
    suffixIcon: suffixIcon,
    prefixIcon: prefixIcon,
  );
}
