import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/projects_filter/data/models/renovate_house_filter/renovate_house_fixed_package_filter_response_model.dart';
import 'package:home4u/features/projects_filter/presentation/widgets/renovate_house_custom_package/renovate_house_custom_package_tab_view_item_title.dart';

import '../../../../../core/utils/app_constants.dart';
import '../filter_image_and_name_widget.dart';
import '../services_const_data.dart';

class RenovateHouseCustomPackageTabViewIteContent extends StatelessWidget {
  final RenovateHouseCustomPackageContent renovateItem;

  const RenovateHouseCustomPackageTabViewIteContent({
    super.key,
    required this.renovateItem,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(32.r),
      child: Column(
        spacing: 16.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RenovateHouseCustomPackageTabViewItemTitle(
            packageName: renovateItem.customPackage?.name ?? 'N/A',
          ),
          FilterImageAndNameWidget(
            imageUrl: renovateItem.user?.personalPhoto,
            userName: renovateItem.user?.username,
            timeAgo: formatDate(renovateItem.createdDate),
          ),
          ServicesConstData(
            government: null,
            projectStatus: renovateItem.askStatus ?? 'N/A',
          ),
        ],
      ),
    );
  }
}
