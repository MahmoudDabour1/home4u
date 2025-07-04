import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/projects_filter/presentation/widgets/request_design_widgets/request_design_tab_view_item_title.dart';

import '../../../data/models/request_design_filter/request_design_filter_response_model.dart';
import '../filter_image_and_name_widget.dart';
import '../services_const_data.dart';

class RequestDesignTabViewItemContent extends StatelessWidget {
  final RequestDesignFilterContent requestDesignItem;

  const RequestDesignTabViewItemContent({
    super.key,
    required this.requestDesignItem,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(32.r),
      child: Column(
        spacing: 16.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RequestDesignTabViewItemTitle(
            unitType: requestDesignItem.unitType?.name ?? 'N/A',
            unitArea: requestDesignItem.unitArea ?? 0,
          ),
          FilterImageAndNameWidget(),
          ServicesConstData(
            government: requestDesignItem.governorate?.name ?? 'N/A',
            projectStatus: 'available',
          ),
        ],
      ),
    );
  }
}
