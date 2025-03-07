import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home4u/core/utils/spacing.dart';

import '../../../../core/theming/app_styles.dart';

class ProductsCustomRowWidget extends StatelessWidget {
  final String title;
  final String? iconImage;
  final TextStyle? textStyle;

  const ProductsCustomRowWidget(
      {super.key,
      required this.title,
      this.iconImage,
      this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8.w,
      children: [
        SvgPicture.asset(
          iconImage!,
          width: 16.w,
          height: 16.h,
        ),
        Text(title, style: textStyle ?? AppStyles.font16GrayLight),
      ],
    );
  }
}
