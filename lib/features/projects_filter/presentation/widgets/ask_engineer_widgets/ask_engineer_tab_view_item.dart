import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/extensions/navigation_extension.dart';
import 'package:home4u/features/projects_filter/presentation/widgets/ask_engineer_widgets/ask_engineer_tab_view_content.dart';

import '../../../../../core/routing/routes.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../data/models/ask_filter/engineer/ask_engineer_filter_response_model.dart';
import '../filter_offer_badge_widget.dart';

class AskEngineerTabViewItem extends StatelessWidget {
  final AskEngineerContent askEngineer;


  const AskEngineerTabViewItem({super.key, required this.askEngineer});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        context.pushNamed(
          Routes.askEngineerProjectDetailsScreen,
          arguments: askEngineer.id,
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
            child: AskEngineerTabViewContent(askEngineer: askEngineer),
          ),
          FilterOfferBadgeWidget(
            badgeCount: askEngineer.requestCount.toString(),
          ),
        ],
      ),
    );
  }
}
