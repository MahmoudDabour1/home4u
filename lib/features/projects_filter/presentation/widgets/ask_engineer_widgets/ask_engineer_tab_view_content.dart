import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/projects_filter/data/models/ask_filter/engineer/ask_engineer_filter_response_model.dart';

import '../../../../../core/utils/app_constants.dart';
import '../filter_image_and_name_widget.dart';
import '../services_const_data.dart';
import 'ask_engineer_tab_view_item_title.dart';

class AskEngineerTabViewContent extends StatelessWidget {
  final AskEngineerContent askEngineer;

  const AskEngineerTabViewContent({super.key, required this.askEngineer});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(32.r),
      child: Column(
        spacing: 16.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AskEngineerTabViewItemTitle(
            projectName: askEngineer.projectName ?? 'N/A',
          ),
          FilterImageAndNameWidget(
            imageUrl: askEngineer.user?.personalPhoto,
            userName: askEngineer.user?.username,
            timeAgo: formatDate(askEngineer.createdDate),
          ),
          ServicesConstData(
            government: askEngineer.governorate?.name ?? 'N/A',
            projectStatus: askEngineer.askStatus ?? 'N/A',
          ),
        ],
      ),
    );
  }
}
