import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/projects_filter/data/models/ask_filter/technical/ask_technical_worker_filter_response_model.dart';

import '../../../../../core/utils/app_constants.dart';
import '../filter_image_and_name_widget.dart';
import '../services_const_data.dart';
import 'ask_technical_tab_view_item_title.dart';

class AskTechnicalTabViewContent extends StatelessWidget {
  final AskTechnicalContent askTechnical;

  const AskTechnicalTabViewContent({
    super.key,
    required this.askTechnical,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(32.r),
      child: Column(
        spacing: 16.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AskTechnicalTabViewItemTitle(
            projectName: askTechnical.projectName ?? 'N/A',
          ),
          FilterImageAndNameWidget(
            imageUrl: askTechnical.user?.personalPhoto,
            userName: askTechnical.user?.username,
            timeAgo: formatDate(askTechnical.createdDate),
          ),
          ServicesConstData(
            government: askTechnical.governorate?.name ?? 'N/A',
            projectStatus:  askTechnical.askStatus ?? 'N/A' ,
          ),
        ],
      ),
    );
  }
}
