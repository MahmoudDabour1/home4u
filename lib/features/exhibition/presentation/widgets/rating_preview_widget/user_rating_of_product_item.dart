import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home4u/core/theming/app_assets.dart';
import 'package:home4u/core/theming/app_colors.dart';
import 'package:home4u/core/theming/app_styles.dart';
import 'package:home4u/features/exhibition/presentation/widgets/rating_preview_widget/rating_stars_widget.dart';

class UserRatingOfProductItem extends StatelessWidget {
  const UserRatingOfProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: 292.h,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(16).r,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0).h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16.w,
          children: [
            CircleAvatar(
              radius: 30.r,
              backgroundImage: NetworkImage(
                'https://cdn.vectorstock.com/i/1000v/23/81/default-avatar-profile-icon-vector-18942381.jpg',
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 16.w,
                children: [
                  _buildUserDataAndRating(),
                  Expanded(
                    child: AutoSizeText(
                      "tantaff  my fraff was very helpful. [collntaff  my friends a.ction is outstanding and the staff was very helpful. [collntaff  my friends a.ction is outstanding and the staff was very helpful. [collul. [collection is outstan",
                      style: AppStyles.font16BlackLight,
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  _checkHelpfulComments(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _checkHelpfulComments() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 6.w,
      children: [
        SvgPicture.asset(
          AppAssets.likeIcon,
          width: 24.w,
          height: 24.h,
        ),
        Text(
          "Helpful",
          style: AppStyles.font16BlackLight,
        ),
        Text(
          "(22)",
          style: AppStyles.font16BlackLight,
        ),
      ],
    );
  }

  Widget _buildUserDataAndRating() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 4.w,
      children: [
        Text(
          "John Doe",
          style: AppStyles.font16BlackSemiBold,
        ),
        Text(
          "2 day ago",
          style: AppStyles.font16BlackLight,
        ),
        RatingStarsWidget(),
      ],
    );
  }
}
