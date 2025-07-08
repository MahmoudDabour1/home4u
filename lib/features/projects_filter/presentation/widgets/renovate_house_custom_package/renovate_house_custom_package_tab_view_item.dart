import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/extensions/navigation_extension.dart';
import 'package:home4u/features/projects_filter/presentation/widgets/renovate_house_custom_package/renovate_house_custom_package_tab_view_ite_content.dart';

import '../../../../../core/routing/routes.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../data/models/renovate_house_filter/renovate_house_fixed_package_filter_response_model.dart';
import '../filter_offer_badge_widget.dart';

class RenovateHouseCustomPackageTabViewItem extends StatelessWidget {
  final RenovateHouseCustomPackageContent renovateItem;

  const RenovateHouseCustomPackageTabViewItem({
    super.key,
    required this.renovateItem,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(
          Routes.renovateHouseCustomPackageServiceDetailsScreen,
          arguments: renovateItem.customPackage?.id,
        );
      },
      child: Stack(
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
              color: AppColors.containersColor,
              borderRadius: BorderRadius.circular(24.r),
            ),
            child: RenovateHouseCustomPackageTabViewIteContent(
              renovateItem: renovateItem,
            ),
          ),
          FilterOfferBadgeWidget(
            badgeCount: renovateItem.requestCount.toString(),
          ),
        ],
      ),
    );
  }
}
