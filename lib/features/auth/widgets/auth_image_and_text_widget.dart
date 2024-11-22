import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/widgets/app_back_button.dart';

import '../../../core/theming/app_styles.dart';
import '../../../core/utils/spacing.dart';

class AuthImageAndTextWidget extends StatelessWidget {
  final String image;
  final String text;
  final  String subText;
  final bool isBackButton ;
  const AuthImageAndTextWidget({super.key, required this.image, required this.text, required this.subText,  this.isBackButton=false});

  @override
  Widget build(BuildContext context) {
    return  Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Image.asset(
          image,
        ),
        isBackButton?Positioned(
            top: 16.h,
            left: 24.w,
            child: AppBackButton()):SizedBox.shrink(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                text,
                style: AppStyles.font20BlackBold,
              ),
              verticalSpace(12),
              Text(
                subText,
                style: AppStyles.font16DarkBlueLight,
              ),
              verticalSpace(40),
            ],
          ),
        ),
      ],
    );
  }
}
