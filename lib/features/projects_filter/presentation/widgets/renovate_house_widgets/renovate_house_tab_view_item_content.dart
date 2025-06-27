import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/projects_filter/presentation/widgets/renovate_house_widgets/renovate_house_tab_view_item_title.dart';

import '../filter_image_and_name_widget.dart';
import '../project_skills_needed_widget.dart';
import '../service_row_item.dart';
import '../services_const_data.dart';

class RenovateHouseTabViewItemContent extends StatelessWidget {
  const RenovateHouseTabViewItemContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(32.r),
      child: Column(
        spacing: 16.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RenovateHouseTabViewItemTitle(
            unitType: "Villa",
            unitArea: 100,
          ),
          FilterImageAndNameWidget(),
          ServiceRowItem(
            serviceKey: "Works needed : ",
            serviceValue: "Electromechanical Works",
          ),
          ServicesConstData(
            government: 'Cairo',
            projectStatus: 'available',
          ),
          ProjectSkillsNeededWidget(),
        ],
      ),
    );
  }
}
