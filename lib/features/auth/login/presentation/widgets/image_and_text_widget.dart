import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/utils/spacing.dart';

class ImageAndTextWidget extends StatelessWidget {
  final String image;
  final String text;
  final  String subText;
  const ImageAndTextWidget({super.key, required this.image, required this.text, required this.subText});

  @override
  Widget build(BuildContext context) {
    return   Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Image.asset(
          image,
        ),
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
