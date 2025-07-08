import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../data/models/ask_requests/renovate_house_custom_package_request/renovate_house_custom_package_request_response_model.dart';
import '../filter_image_and_name_widget.dart';

class RenovateHouseCustomPackageRequestItem extends StatelessWidget {
  final RenovateHouseCustomPackageRequestData requestData;

  const RenovateHouseCustomPackageRequestItem({
    super.key,
    required this.requestData,
  });

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
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: FilterImageAndNameWidget(
                    imageUrl: requestData.user?.personalPhoto,
                    userName: requestData.user?.username,
                    timeAgo: formatDate(
                      requestData.user?.createdDate,
                    ),
                  ),
                ),
              ],
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
              requestData.comment ?? 'N/A',
              style: AppStyles.font16BlackMedium,
            ),
          ],
        ),
      ),
    );
  }
}
