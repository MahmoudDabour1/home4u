import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/projects_filter/data/models/request_design_filter/request_design_filter_response_model.dart';
import 'package:home4u/features/projects_filter/presentation/widgets/request_design_widgets/request_design_tab_view_item_content.dart';

import '../../../../../core/theming/app_colors.dart';
import '../filter_offer_badge_widget.dart';

class RequestDesignTabViewItem extends StatelessWidget {
  final RequestDesignFilterContent requestDesignItem;

  const RequestDesignTabViewItem({super.key, required this.requestDesignItem,});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery
              .sizeOf(context)
              .width,
          height: MediaQuery
              .sizeOf(context)
              .height * 0.31,
          decoration: BoxDecoration(
            color: AppColors.containersColor,
            borderRadius: BorderRadius.circular(24.r),
          ),
          child: RequestDesignTabViewItemContent(
            requestDesignItem: requestDesignItem,
          ),
        ),
        FilterOfferBadgeWidget(),
      ],
    );
  }
}
