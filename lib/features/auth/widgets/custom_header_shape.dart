import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/networking/api_constants.dart';
import 'package:home4u/core/theming/app_colors.dart';

import 'custom_card_clipper.dart';

class CustomHeaderShape extends StatelessWidget {
  final bool isImage;
  final String? imageUrl;

  const CustomHeaderShape({
    super.key,
    this.isImage = false,
    this.imageUrl,
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
                  image: imageUrl!.isNotEmpty
                      ? NetworkImage(
                          ApiConstants.getImageBaseUrl(imageUrl ?? ''))
                      : AssetImage("assets/images/profile_back_image.png"),
                  fit: BoxFit.cover,
                )
              : null,
        ),
      ),
    );
  }
}
