import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/networking/api_constants.dart';
import 'package:home4u/core/widgets/fancy_image.dart';

import '../../../../core/theming/app_styles.dart';
import '../../../../core/utils/spacing.dart';

class FilterImageAndNameWidget extends StatelessWidget {
  final String? imageUrl;
  final String? userName;
  final String? timeAgo;

  const FilterImageAndNameWidget({
    super.key,
    this.imageUrl,
    this.userName,
    this.timeAgo,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 30.r,
          backgroundImage: imageUrl == null
              ? const NetworkImage(
                  'https://cdn.vectorstock.com/i/1000v/23/81/default-avatar-profile-icon-vector-18942381.jpg')
              : null,
          child: imageUrl != null
              ? ClipOval(
                  child: FancyImage(
                    imagePath: ApiConstants.getImageBaseUrl(imageUrl!),
                    width: 60.w,
                    height: 60.h,
                  ),
                )
              : null,
        ),
        horizontalSpace(8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              userName ?? 'Unknown User',
              style: AppStyles.font16BlackMedium,
            ),
            SizedBox(height: 8.h),
            Text(
              'created: ${timeAgo ?? 'Just now'}' ,
              style: AppStyles.font16GrayLight,
            ),
          ],
        )
      ],
    );
  }
}
