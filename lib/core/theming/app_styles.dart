import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/theming/app_colors.dart';
import 'package:home4u/core/theming/font_weight_helper.dart';

class AppStyles {

  static TextStyle font16BlackMedium = TextStyle(
    fontSize: 16.sp,
    color: AppColors.blackColor,
    fontWeight: FontWeightHelper.medium,
  );
  static  TextStyle font16BlackLight = TextStyle(
    fontSize: 16.sp,
    color: AppColors.blackColor,
    fontWeight: FontWeightHelper.light,
  );static  TextStyle font16DarkBlueBold = TextStyle(
    fontSize: 16.sp,
    color: AppColors.secondaryColor,
    fontWeight: FontWeightHelper.bold,
  );
  static  TextStyle font20BlackBold = TextStyle(
    fontSize: 20.sp,
    color: AppColors.blackColor,
    fontWeight: FontWeightHelper.bold,
  );static  TextStyle font14DarkBlueBold= TextStyle(
    fontSize: 14.sp,
    color: AppColors.secondaryColor,
    fontWeight: FontWeightHelper.bold,
  );
  static TextStyle font16WhiteBold = TextStyle(
    fontSize: 16.sp,
    color: AppColors.whiteColor,
    fontWeight: FontWeightHelper.bold,
  );
  static TextStyle font20BlackMedium = TextStyle(
    fontSize: 20.sp,
    color: AppColors.blackColor,
    fontWeight: FontWeightHelper.medium,
  );
}