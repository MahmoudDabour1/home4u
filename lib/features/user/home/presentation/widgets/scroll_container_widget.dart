import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:solar_icons/solar_icons.dart';

import '../../../../../core/theming/app_assets.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/utils/spacing.dart';

class ScrollContainerWidget extends StatefulWidget {
  final String image;
  final String title;
  final String starCount;

  const ScrollContainerWidget(
      {super.key,
      required this.image,
      required this.title,
      required this.starCount});

  @override
  State<ScrollContainerWidget> createState() => _ScrollContainerWidgetState();
}

class _ScrollContainerWidgetState extends State<ScrollContainerWidget> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 278.w,
      height: 178.h,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.grayColor, width: 1),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.r),
              topRight: Radius.circular(16.r),
            ),
            child: Stack(
              children: [
                Image.asset(
                  widget.image,
                  height: 122.h,
                  width: MediaQuery.sizeOf(context).width,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 16.h,
                  right: 16.w,
                  child: Container(
                    width: 40.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.offWhiteColor,
                    ),
                    child: IconButton(
                      icon: Icon(
                        SolarIconsBold.heart,
                        color: isFavorite? Colors.red:AppColors.grayColor,
                        size: 24.h,
                      ),
                      onPressed: () {
                        setState(() {
                          isFavorite = !isFavorite;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          verticalSpace(16),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.h),
            child: Row(
              children: [
                Text(
                  widget.title,
                  style: AppStyles.font16BlackMedium,
                ),
                const Spacer(),
                Row(
                  children: [
                    Text(
                      widget.starCount,
                      style: AppStyles.font16BlackLight,
                    ),
                    horizontalSpace(4),
                    SvgPicture.asset(
                      AppAssets.starSvgImage,
                      width: 16.w,
                      height: 16.h,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
