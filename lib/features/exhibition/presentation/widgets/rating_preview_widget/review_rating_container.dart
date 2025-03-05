
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/theming/app_styles.dart';
import 'package:home4u/features/exhibition/presentation/widgets/rating_preview_widget/rating_stars_widget.dart';
import 'package:home4u/features/exhibition/presentation/widgets/rating_preview_widget/slider_rating_box_widget.dart';
import 'package:home4u/locale/app_locale.dart';

class ReviewRatingContainer extends StatelessWidget {
  const ReviewRatingContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: 400.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16).r,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0).h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 32.h,
          children: [
            _buildUsersAverageRating(),
            _buildRatingStarsStatusWithPercentage(context),
          ],
        ),
      ),
    );
  }

  Widget _buildUsersAverageRating() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16.h,
      children: [
        Text(
          "4.5",
          style: AppStyles.font32BlackSemiBold,
        ),
        RatingStarsWidget(),
        Text(
          "Based on 128 reviews",
          style: AppStyles.font24BlackMedium.copyWith(
            color: Color(0xff000000).withOpacity(0.5),
          ),
        ),
      ],
    );
  }

  Widget _buildRatingStarsStatusWithPercentage(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16.h,
      children: [
        SliderRatingBoxWidget(
          progress: 90 / 100,
          starNumber: AppLocale.fiveStars.getString(context),
          starPercentage: 90,
        ),
        SliderRatingBoxWidget(
          progress: 80 / 100,
          starNumber: AppLocale.fourStars.getString(context),
          starPercentage: 80,
        ),
        SliderRatingBoxWidget(
          progress: 70 / 100,
          starNumber: AppLocale.threeStars.getString(context),
          starPercentage: 70,
        ),
        SliderRatingBoxWidget(
          progress: 60 / 100,
          starNumber: AppLocale.twoStars.getString(context),
          starPercentage: 60,
        ),
        SliderRatingBoxWidget(
          progress: 30 / 100,
          starNumber: AppLocale.oneStars.getString(context),
          starPercentage: 30,
        ),
      ],
    );
  }
}
