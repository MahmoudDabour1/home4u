import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_styles.dart';
import '../../../../core/utils/spacing.dart';
import 'list_tile_item.dart';

class MyAccountSection extends StatelessWidget {
  const MyAccountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpace(16),
        Text(
          'My account',
          style: AppStyles.font20BlackMedium,
        ),
        verticalSpace(8),
        Container(
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Column(
            children: [
              ListTileItem(
                imageUrl: "assets/images/location_icon.png",
                title: "Addresses",
                onTap: () async {},
              ),
              ListTileItem(
                imageUrl: "assets/images/credit-card_icon.png",
                title: "Payment",
                onTap: () {},
                isLastItem: true,
              ),
            ],
          ),
        ),
        verticalSpace(16),
      ],
    );
  }
}
