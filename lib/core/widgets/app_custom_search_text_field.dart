import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../locale/app_locale.dart';
import '../theming/app_colors.dart';
import '../theming/app_styles.dart';

class AppCustomSearchTextField extends StatelessWidget {
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final Color? fillColor;
  final bool? isHasBorder;
  final String? hintText;
  final TextStyle? hintStyle;
  final double? borderRadius;
  final void Function(String?)? onFieldSubmitted;

  const AppCustomSearchTextField({super.key,
    this.controller,
    this.onChanged,
    this.onSaved,
    this.fillColor,
    this.isHasBorder = false, this.hintText, this.hintStyle, this.borderRadius, this.onFieldSubmitted,});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      onSaved: onSaved,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        // constraints: BoxConstraints(
        //   maxHeight: 40.h,
        // ),
        hintText: hintText ?? AppLocale.search.getString(context),
        prefixIcon: Icon(
          Icons.search_outlined,
          color: AppColors.grayColor,
          size: 25.r,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 16.r),
          borderSide: isHasBorder == true ? BorderSide() : BorderSide.none,
        ),
        hintStyle: hintStyle ?? AppStyles.font16GrayLight,
        fillColor: fillColor ?? AppColors.whiteColor,
        filled: true,
        // hoverColor: AppColors.blueColor,
      ),
    );
  }
}
