import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/extensions/navigation_extension.dart';
import 'package:home4u/core/theming/app_assets.dart';
import 'package:home4u/core/theming/app_styles.dart';
import 'package:home4u/core/utils/spacing.dart';
import 'package:home4u/features/user/home/presentation/widgets/best_office_widget/best_office_widget.dart';
import 'package:home4u/features/user/home/presentation/widgets/best_show_rooms_widget/best_show_rooms_widget.dart';
import 'package:home4u/features/user/home/presentation/widgets/home_header_widget.dart';
import 'package:home4u/features/user/home/presentation/widgets/services_widget/services_widget.dart';
import 'package:home4u/features/user/home/presentation/widgets/today_offer-widget/today_offers_widget.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/font_weight_helper.dart';
import '../../../../core/widgets/app_custom_search_text_field.dart';

class UserHomeScreen extends StatelessWidget {
  const UserHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     AppLocale.home.getString(context),
      //     style: AppStyles.font20WhiteBold.copyWith(
      //       color: AppColors.blackColor,
      //     ),
      //   ),
      //   centerTitle: true,
      //   backgroundColor: AppColors.whiteColor,
      //   elevation: 0,
      //   automaticallyImplyLeading: false,
      //   actions: [
      //     IconButton(
      //       icon: const Icon(Icons.notifications_none_outlined),
      //       onPressed: () {
      //         context.pushNamed(Routes.ordersScreen);
      //       },
      //     ),
      //   ],
      // ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              HomeHeaderWidget(),
              verticalSpace(16),
              TodayOffersWidget(),
              ServicesWidget(),
              BestOfficeWidget(),
              BestShowRoomsWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
