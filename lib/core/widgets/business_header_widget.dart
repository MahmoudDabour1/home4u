import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home4u/core/theming/app_styles.dart';
import 'package:home4u/core/widgets/app_back_button.dart';

import '../../features/auth/widgets/custom_header_shape.dart';
import '../theming/app_assets.dart';
import '../theming/app_colors.dart';
import '../theming/font_weight_helper.dart';

class BusinessHeaderWidget extends StatelessWidget {
  final String headerTitle;
  final String? headerIcon;
  final bool isBackButton;

  final bool isDrawer;
  final bool isHasIcon ;

  const BusinessHeaderWidget({
    super.key,
    required this.headerTitle,
    this.headerIcon,
    this.isBackButton = false,
    this.isDrawer = true,
    this.isHasIcon = true,
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
              _buildHeaderMenu(context,isDrawer: isDrawer),
              Spacer(),
              _buildHeaderTitle(isHasIcon: isHasIcon),
              Spacer(),
              _buildHeaderNotification(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildHeaderMenu(BuildContext context,{required bool isDrawer }) {
    return GestureDetector(
      onTap: () {
       isDrawer==true? Scaffold.of(context).openDrawer():null;
      },
      child: isDrawer==true? Icon(
        Icons.menu,
        size: 36.r,
        color: AppColors.whiteColor,
      ):AppBackButton(),
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

  Widget _buildHeaderTitle({required isHasIcon}) {
    return Row(
      spacing:  isHasIcon==true?4.w:0,
      children: [
      isHasIcon==true?  SvgPicture.asset(
          headerIcon ?? '',
          width: 24.w,
          height: 24.h,
          alignment: Alignment.center,
          // colorFilter: ColorFilter.mode(
          //   AppColors.whiteColor,
          //   BlendMode.srcIn,
          // ),
        ):SizedBox.shrink(),
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
