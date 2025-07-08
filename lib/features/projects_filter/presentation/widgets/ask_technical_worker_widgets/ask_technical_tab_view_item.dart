import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/extensions/navigation_extension.dart';
import 'package:home4u/core/routing/routes.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../data/models/ask_filter/technical/ask_technical_worker_filter_response_model.dart';
import '../filter_offer_badge_widget.dart';
import 'ask_technical_tab_view_content.dart';

class AskTechnicalTabViewItem extends StatelessWidget {
  final AskTechnicalContent askTechnical;

  const AskTechnicalTabViewItem({super.key, required this.askTechnical,});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        context.pushNamed(
          Routes.askTechnicalProjectDetailsScreen,
          arguments: askTechnical.id,
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
            child: AskTechnicalTabViewContent(
              askTechnical: askTechnical,
            ),
          ),
          FilterOfferBadgeWidget(
             badgeCount: askTechnical.requestCount.toString(),
          ),
        ],
      ),
    );
  }
}
