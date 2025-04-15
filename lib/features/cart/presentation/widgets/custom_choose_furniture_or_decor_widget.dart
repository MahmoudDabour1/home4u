import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home4u/core/theming/app_colors.dart';
import 'package:home4u/core/theming/app_styles.dart';

class CustomChooseFurnitureOrDecorWidget extends StatelessWidget {
  final String image;
  final String title;
  final String subTitle;
  final bool isSelected;
  final VoidCallback onTap;

  const CustomChooseFurnitureOrDecorWidget({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.isSelected, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 170.h,
        width: MediaQuery.sizeOf(context).width * 0.415,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.grayColor : AppColors.whiteColor,
          border: Border.all(
            color: AppColors.grayColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0).h,
          child: Column(
            spacing: 8.h,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 36.r,
                backgroundColor: AppColors.primaryColor,
                child: SvgPicture.asset(
                  image,
                  width: 24.w,
                  height: 24.h,
                ),
              ),
              Text(
                title,
                style: AppStyles.font16BlackLight,
                textAlign: TextAlign.center,
              ),
              Text(
                subTitle,
                style: AppStyles.font12BlackLight,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
