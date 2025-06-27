import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/locale/app_locale.dart';

import '../../../../../../core/theming/app_colors.dart';
import '../../../../../../core/theming/app_styles.dart';
import '../../../../../../core/utils/spacing.dart';
import '../../../../data/models/rating_reviews_response_model.dart';

class RatingReviewsSingleItem extends StatelessWidget {
  final RatingReviewResponseModel data;
  final int index;

  const RatingReviewsSingleItem(
      {super.key, required this.data, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 25.r,
                backgroundColor: AppColors.grayColor.withOpacity(0.2),
                backgroundImage: (data.data?.content?[index].userImage == null ||
                    data.data!.content![index].userImage!.isEmpty)
                    ? AssetImage("assets/images/user_placeholder.png")
                as ImageProvider
                    : NetworkImage(data.data!.content![index].userImage!),
              ),
              horizontalSpace(8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.data?.content?[index].userName ?? "",
                    style: AppStyles.font16BlackMedium,
                  ),
                  Text(
                    data.data?.content?[index].createdDate ?? "",
                    style: AppStyles.font16BlackLight,
                  ),
                ],
              ),
              Spacer(),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.filledGrayColor,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  child: Row(
                    children: [
                      Icon(
                        Icons.verified_rounded,
                        size: 16.r,
                      ),
                      Text(
                        AppLocale.verifiedPurchase.getString(context),
                        style: AppStyles.font14BlackLight,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          RSizedBox.vertical(8),
          RatingBar.readOnly(
            filledColor: Colors.green,
            size: 20.w,
            isHalfAllowed: true,
            initialRating: data.data?.content?[index].rate?.toDouble() ?? 0.0,
            maxRating: 5,
            halfFilledIcon: Icons.star_half,
            filledIcon: Icons.star,
            emptyIcon: Icons.star_border,
            halfFilledColor: Colors.green,
          ),
          verticalSpace(16),
          Text(
            data.data?.content?[0].comment ?? "",
            style: AppStyles.font16BlackMedium,
          ),
          verticalSpace(8),
          Divider(),
        ],
      ),
    );
  }
}
