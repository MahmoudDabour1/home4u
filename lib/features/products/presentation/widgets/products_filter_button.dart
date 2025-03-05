import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theming/app_assets.dart';
import '../../../../core/theming/app_colors.dart';

class ProductsFilterButton extends StatelessWidget {
  const ProductsFilterButton({super.key});
  void _showFilterDrawer(BuildContext context) {
    Scaffold.of(context).openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return   GestureDetector(
      onTap: ()=>_showFilterDrawer(context),
      child: Container(
        width: 40.w,
        height: 40.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: AppColors.whiteColor,
        ),
        child: Align(
          child: SvgPicture.asset(
            AppAssets.filterSvg,
            width: 24.w,
            height: 24.h,
          ),
        ),
      ),
    );
  }
}
