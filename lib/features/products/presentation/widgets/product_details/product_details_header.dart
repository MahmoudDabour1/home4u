import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/theming/app_assets.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../../locale/app_locale.dart';

class ProductDetailsHeader extends StatelessWidget {
  const ProductDetailsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 42.h, left: 24.w, right: 24.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 8.h,
        children: [
          _buildProductDetailsTitle(context),
          Text(
            AppLocale.productPreviewSubTitle.getString(context),
            style: AppStyles.font16BlackLight,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildProductDetailsTitle(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 4.w,
      children: [
        SvgPicture.asset(
          AppAssets.productPreviewIcon,
        ),
        Text(
          AppLocale.productPreview.getString(context),
          style: AppStyles.font24BlackMedium,
        ),
      ],
    );
  }
}
