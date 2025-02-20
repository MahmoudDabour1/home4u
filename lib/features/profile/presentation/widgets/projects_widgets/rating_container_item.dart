import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/utils/spacing.dart';

class RatingContainerItem extends StatelessWidget {
  final String ratingText;
  final IconData icon;
  final Color iconColor;

  const RatingContainerItem({
    super.key,
    required this.ratingText,
    required this.icon,
    this.iconColor = Colors.yellow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.w,
      height: 25.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        children: [
          horizontalSpace(8),
          Icon(
            icon,
            color: iconColor,
            size: 14.r,
          ),
          horizontalSpace(4),
          Text(
            ratingText,
            style: AppStyles.font14BlackLight,
          ),
        ],
      ),
    );
  }
}
