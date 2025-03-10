import 'dart:developer';

import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/app_colors.dart';

class RatingStarsWidget extends StatelessWidget {
  const RatingStarsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isRTL = Directionality.of(context) == TextDirection.rtl;

    return Transform(
      transform: isRTL ? Matrix4.rotationY(3.14) : Matrix4.identity(),
      alignment: Alignment.center,
      child: RatingBar(
        filledIcon: Icons.star,
        emptyIcon: Icons.star_outline,
        halfFilledIcon : Icons.star_half,
        initialRating: 4.5,
        halfFilledColor: AppColors.ratingColor,
        emptyColor: AppColors.grayColor,
        filledColor: AppColors.ratingColor,
        isHalfAllowed: true,
        size: 38.r,
        onRatingChanged: (rating) {
          log(rating.toString());
        },
      ),
    );
  }
}