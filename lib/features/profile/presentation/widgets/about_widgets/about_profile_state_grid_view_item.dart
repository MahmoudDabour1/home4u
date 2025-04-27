import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/utils/spacing.dart';

class AboutProfileStateGridViewItem extends StatelessWidget {
  final String? title;
  final String subTitle;
  final String imagePath;
  const AboutProfileStateGridViewItem({super.key, required this.title,required this.subTitle,required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height * 0.129,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: AppColors.containersColor,
      ),
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 8.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: Text(
                title!,
                textAlign: TextAlign.center,
                maxLines: 2,
                style: AppStyles.font16BlackMedium,
              ),
            ),
            verticalSpace(4),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              alignment: WrapAlignment.center,
              children: [
                SvgPicture.asset(
                  imagePath,
                  width: 16.w,
                  height: 16.h,
                ),
                horizontalSpace(4),
                Text(
                  subTitle,
                  maxLines: 2,
                  // overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: AppStyles.font16BlackLight.copyWith(
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
