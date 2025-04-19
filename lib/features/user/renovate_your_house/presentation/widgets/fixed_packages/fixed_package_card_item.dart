import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/theming/app_styles.dart';
import 'package:home4u/core/utils/spacing.dart';
import 'package:home4u/features/user/renovate_your_house/presentation/widgets/fixed_packages/fixed_package_booking_button.dart';

import '../../../../../../core/theming/app_colors.dart';
import '../../../data/models/renovate_your_house_fixed_packages_model.dart';
import 'fixed_package_details.dart';

class FixedPackageCard extends StatelessWidget {
  final FixedPackageDataModel package;
  final VoidCallback onBooking;

  const FixedPackageCard({
    super.key,
    required this.package,
    required this.onBooking,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 16.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.scaffoldBusinessBackgroundColor,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.grayColor.withValues(alpha: 0.7),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                package.name,
                style: AppStyles.font16BlackBold,
              ),
              Text(
                "${package.price} M/LE",
                style: AppStyles.font16BlackBold,
              ),
            ],
          ),
          verticalSpace(8),
          FixedPackageDetails(details: package.details),
          verticalSpace(32),
          FixedPackageBookingButton(
            onPressed: onBooking,
          ),
        ],
      ),
    );
  }
}
