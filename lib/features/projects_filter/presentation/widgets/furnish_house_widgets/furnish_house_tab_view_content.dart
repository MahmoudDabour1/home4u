import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/models/renovate_house_filter/renovate_house_filter_response_model.dart';
import '../filter_image_and_name_widget.dart';
import '../project_skills_needed_widget.dart';
import '../services_const_data.dart';
import 'furnish_house_tab_view_item_title.dart';

class FurnishHouseTabViewContent extends StatelessWidget {
  final RenovateHouseContent renovateItem;

  const FurnishHouseTabViewContent({super.key, required this.renovateItem});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(32.r),
      child: Column(
        spacing: 16.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FurnishHouseTabViewItemTitle(
            unitType: renovateItem.unitType?.name ?? 'N/A',
          ),
          FilterImageAndNameWidget(),
          // ServiceRowItem(
          //   serviceKey: "Works needed : ",
          //   serviceValue: "Electromechanical Works",
          // ),
          ServicesConstData(
            government: renovateItem.governorate?.name ?? 'N/A',
            projectStatus: 'available',
          ),
          ProjectSkillsNeededWidget(),
        ],
      ),
    );
  }
}
