import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/projects_filter/presentation/widgets/renovate_house_widgets/renovate_house_tab_view_item_title.dart';
import 'package:home4u/locale/app_locale.dart';

import '../../../../../core/utils/app_constants.dart';
import '../../../data/models/renovate_house_filter/renovate_house_filter_response_model.dart';
import '../filter_image_and_name_widget.dart';
import '../project_skills_needed_widget.dart';
import '../service_row_item.dart';
import '../services_const_data.dart';

class RenovateHouseTabViewItemContent extends StatelessWidget {
  final RenovateHouseContent renovateItem;

  const RenovateHouseTabViewItemContent(
      {super.key, required this.renovateItem});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(32.r),
      child: Column(
        spacing: 16.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RenovateHouseTabViewItemTitle(
            unitType: renovateItem.unitType?.name ?? 'N/A',
            unitArea: renovateItem.unitArea ?? 0,
          ),
          FilterImageAndNameWidget(
            imageUrl: renovateItem.user?.personalPhoto,
            userName: renovateItem.user?.username,
            timeAgo: formatDate(renovateItem.createdDate),
          ),
          ServiceRowItem(
            serviceKey: '${AppLocale.finishType.getString(context)}:',
            serviceValue: renovateItem.unitStatuses?.name ?? 'N/A',
          ),
          ServicesConstData(
            government: renovateItem.governorate?.name ?? 'N/A',
            projectStatus:  renovateItem.askStatus ?? 'N/A',
          ),
          ProjectSkillsNeededWidget(
            skillNeeded: renovateItem.workSkills?.name ?? 'N/A',
          ),
        ],
      ),
    );
  }
}
