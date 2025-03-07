import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home4u/core/theming/app_styles.dart';

import '../../features/auth/widgets/custom_header_shape.dart';
import '../theming/app_assets.dart';
import '../theming/app_colors.dart';
import '../theming/font_weight_helper.dart';

class BusinessHeaderWidget extends StatelessWidget {
  final String headerTitle;
  final String headerIcon;
  final VoidCallback menuOnPressed;

  const BusinessHeaderWidget({
    super.key,
    required this.headerTitle,
    required this.headerIcon,
    required this.menuOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CustomHeaderShape(),
        Padding(
          padding: EdgeInsets.only(top: 16.h, left: 25.w, right: 24.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildHeaderMenu(),
              Spacer(),
              _buildHeaderTitle(),
              Spacer(),
              _buildHeaderNotification(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildHeaderMenu() {
    return GestureDetector(
      onTap: menuOnPressed,
      child: Icon(
        Icons.menu,
        size: 36.r,
        color: AppColors.whiteColor,
      ),
    );
  }

  Widget _buildHeaderNotification() {
    return SvgPicture.asset(
      AppAssets.notificationSvgImage,
      width: 24.w,
      height: 24.h,
      colorFilter: ColorFilter.mode(
        AppColors.whiteColor,
        BlendMode.srcIn,
      ),
    );
  }

  Widget _buildHeaderTitle() {
    return Row(
      spacing: 4.w,
      children: [
        SvgPicture.asset(
          headerIcon,
          width: 24.w,
          height: 24.h,
          alignment: Alignment.center,
        ),
        Text(
          headerTitle,
          style: AppStyles.font20WhiteBold.copyWith(
            fontWeight: FontWeightHelper.medium,
          ),
        ),
      ],
    );
  }
}
