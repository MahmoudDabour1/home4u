import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/theming/app_colors.dart';
import '../../../../../../core/theming/app_styles.dart';

class ServicesGridViewItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subTitle;
  final VoidCallback onPressed;

  const ServicesGridViewItem({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subTitle,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height * 0.2,
        decoration: BoxDecoration(
          color: AppColors.filledGrayColor,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                imageUrl,
                height: 40.h,
                width: 40.w,
              ),
              // SvgPicture.asset(
              //   imageUrl,
              //   width: 50.w,
              //   // // MediaQuery.sizeOf(context).width * 0.088,
              //   height:50.h,
              //   // MediaQuery.sizeOf(context).height * 0.088,
              // ),
              Flexible(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.h),
                  child: AutoSizeText(
                    title,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    style: AppStyles.font14BlackMedium,
                  ),
                ),
              ),
              // Expanded(
              //   child: Text(
              //     subTitle,
              //     maxLines: 2,
              //     overflow: TextOverflow.ellipsis,
              //     textAlign: TextAlign.center,
              //     style: AppStyles.font16BlackLight.copyWith(
              //       color: Colors.black.withOpacity(0.4),
              //       overflow: TextOverflow.ellipsis,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
