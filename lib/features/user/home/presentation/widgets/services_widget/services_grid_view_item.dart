import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/theming/app_colors.dart';
import '../../../../../../core/theming/app_styles.dart';

class ServicesGridViewItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subTitle;
  const ServicesGridViewItem({super.key, required this.imageUrl, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.grayColor, width: 1),
      ),
      child: Padding(
        padding:
        EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        child: Column(
          children: [
            SvgPicture.asset(
              imageUrl,
              width: 56.w,
              height: 56.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: Text(
                title,
                textAlign: TextAlign.center,
                maxLines: 1,
                style: AppStyles.font16BlackLight,
              ),
            ),
            Text(
              subTitle,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: AppStyles.font16BlackLight.copyWith(
                color: Colors.black.withOpacity(0.4),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
