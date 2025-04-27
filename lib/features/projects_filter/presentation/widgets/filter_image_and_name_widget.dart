import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_styles.dart';
import '../../../../core/utils/spacing.dart';

class FilterImageAndNameWidget extends StatelessWidget {
  const FilterImageAndNameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return   Row(
      children: [
        CircleAvatar(
          radius: 30.r,
          backgroundImage: NetworkImage(
            'https://cdn.vectorstock.com/i/1000v/23/81/default-avatar-profile-icon-vector-18942381.jpg',
          ),
        ),
        horizontalSpace(8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Mohamed",
              style: AppStyles.font16BlackMedium,
            ),
            SizedBox(height: 8.h),
            Text(
              "2 months ago",
              style: AppStyles.font16GrayLight,
            ),
          ],
        )
      ],
    );
  }
}
