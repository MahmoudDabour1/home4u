import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/theming/app_colors.dart';

import 'custom_card_clipper.dart';

class CustomHeaderShape extends StatelessWidget {
  final bool isImage;

  const CustomHeaderShape({
    super.key,
    this.isImage = false,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomCardClipper(),
      child: Container(
        height: 140.h, // Fixed height
        decoration: BoxDecoration(
          color: AppColors.secondaryColor,
          image: isImage
              ? DecorationImage(
                  image: AssetImage("assets/images/profile_back_image.png"),
                  fit: BoxFit.cover ,
                )
              : null,
        ),
      ),
    );
  }
}
