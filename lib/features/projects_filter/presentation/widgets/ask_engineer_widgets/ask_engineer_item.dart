import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../data/models/asks/engineer_ask/engineer_asks_response_model.dart';
import '../filter_image_and_name_widget.dart';

class AskEngineerItem extends StatelessWidget {
  final AskEngineerData ask;
  const AskEngineerItem({super.key, required this.ask});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        color: AppColors.containersColor,
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 24.w,
          vertical: 16.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          spacing: 16.h,
          children: [
            Expanded(
              flex: 1,
              child: FilterImageAndNameWidget(
                imageUrl: ask.user?.personalPhoto,
                userName: ask.user?.username,
                timeAgo: formatDate(
                  ask.user?.createdDate,
                ),
              ),
            ),
            Row(
              children: [
                Spacer(),
                RatingBar.readOnly(
                  size: 25.w,
                  isHalfAllowed: true,
                  initialRating: 0,
                  maxRating: 5,
                  halfFilledIcon: Icons.star_half,
                  filledIcon: Icons.star,
                  emptyIcon: Icons.star_border,
                ),
              ],
            ),
            Text(
              ask.comment ?? 'N/A',
              style: AppStyles.font16BlackMedium,
            ),
          ],
        ),
      ),
    );
  }
}
