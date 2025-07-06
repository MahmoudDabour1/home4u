import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/app_colors.dart';
import '../filter_offer_badge_widget.dart';
import 'furnish_house_tab_view_content.dart';

class FurnishHouseTabViewItem extends StatelessWidget {
  const FurnishHouseTabViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
            color: AppColors.containersColor,
            borderRadius: BorderRadius.circular(24.r),
          ),
          child: FurnishHouseTabViewContent(),
        ),
        FilterOfferBadgeWidget(),
      ],
    );
  }
}
