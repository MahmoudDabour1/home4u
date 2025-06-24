import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solar_icons/solar_icons.dart';

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
      width: 160.w,
      height: 200.h,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.grayColor, width: 1),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:  EdgeInsets.all(8.0.w),
            child: Container(
              height: 150.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: AppColors.filledGrayColor,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.r),
                  topRight: Radius.circular(8.r),
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding:  EdgeInsets.all(8.r),
                      child: Image.asset(
                        widget.image,
                      height:  MediaQuery.sizeOf(context).height-16.w,
                        width: MediaQuery.sizeOf(context).width-16.w,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 4.h,
                      right: 4.w,
                      child: Container(
                        width: 35.w,
                        height: 35.h,
                        decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(10.r),
                          color: AppColors.whiteColor,
                        ),
                        child: Center(
                          child: IconButton(
                            icon: Icon(
                                Icons.favorite,

                              color: isFavorite ? Colors.red : AppColors.grayColor,
                              size: 20.h,
                            ),
                            onPressed: () {
                              setState(() {
                                isFavorite = !isFavorite;
                              });
                            },
                          ),
                        ),
                      ),
                    ), Positioned(
                      bottom: 4.h,
                      right: 4.w,
                      child: Container(
                        width: 35.w,
                        height: 35.h,
                        decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(10.r),
                          color: AppColors.whiteColor,
                        ),
                        child: IconButton(
                          icon: Icon(
                            Icons.shopping_cart_checkout_sharp,

                            size: 24.h,
                          ),
                          onPressed: () {

                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 8.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: AppStyles.font16BlackMedium,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),

                verticalSpace(8),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.filledGrayColor,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 8.w,vertical: 2.h),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "4.6",
                          style: AppStyles.font14BlackMedium,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.green,
                          size: 20.r,
                        ),
                        horizontalSpace(4),
                        Text(
                          "(20K)",
                          style: AppStyles.font16GrayLight.copyWith(
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                  ),

                ),
                verticalSpace(8),
                RichText(text:
                TextSpan(
                  text: 'EGP ',
                  style: AppStyles.font16BlackLight,
                  children: [
                    TextSpan(
                      text: '51,999',
                      style: AppStyles.font16BlackBold,
                    ),
                  ],
                ),
                ),
                verticalSpace(8),
                Row(
                  children: [
                    Icon(
                      Icons.directions_car_filled,
                      size: 20.r,
                      color: AppColors.darkBlueColor,
                    ),
                    horizontalSpace(4),
                    Text(
                      "Free Delivery",
                      style: AppStyles.font16BlackMedium,
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
