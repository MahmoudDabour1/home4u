import 'dart:developer';

import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/app_colors.dart';

class RatingStarsWidget extends StatelessWidget {
  const RatingStarsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RatingBar(
      filledIcon: Icons.star,
      emptyIcon: Icons.star_outline,
      halfFilledColor: AppColors.ratingColor,
      emptyColor: AppColors.grayColor,
      filledColor: AppColors.ratingColor,
      size: 38.r,
      onRatingChanged: (rating) {
        log(rating.toString());
      },
    );
  }
}
