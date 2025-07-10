import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_colors.dart';
import 'filter_container_content.dart';

class FilterListViewItem extends StatelessWidget {
  const FilterListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.sizeOf(context).width,
          height: 381.h,
          decoration: BoxDecoration(
            color: AppColors.containersColor,
            borderRadius: BorderRadius.circular(24.r),
          ),
          child: FilterContainerContent(),
        ),
        // FilterOfferBadgeWidget(),
      ],
    );
  }
}
