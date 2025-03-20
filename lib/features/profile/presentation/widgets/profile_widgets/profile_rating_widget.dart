import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileRatingWidget extends StatelessWidget {
  const ProfileRatingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RatingBar.readOnly(
      filledIcon: Icons.star,
      emptyIcon: Icons.star_border,
      initialRating: 4,
      maxRating: 5,
      size: 20.r,
      alignment: Alignment.center,
    );
  }
}
