import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/projects_filter/presentation/widgets/renovate_house_widgets/renovate_house_tab_view_item_content.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../data/models/renovate_house_filter/renovate_house_filter_response_model.dart';
import '../filter_container_content.dart';
import '../filter_offer_badge_widget.dart';

class RenovateHouseTabViewItem extends StatelessWidget {
  final RenovateHouseContent renovateItem;

  const RenovateHouseTabViewItem({
    super.key,
    required this.renovateItem,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height * 0.4,
          decoration: BoxDecoration(
            color: AppColors.containersColor,
            borderRadius: BorderRadius.circular(24.r),
          ),
          child: RenovateHouseTabViewItemContent(
            renovateItem: renovateItem,
          ),
        ),
        FilterOfferBadgeWidget(),
      ],
    );
  }
}
