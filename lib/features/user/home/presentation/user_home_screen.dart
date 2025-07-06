import 'package:flutter/material.dart';
import 'package:home4u/core/utils/spacing.dart';
import 'package:home4u/features/user/home/presentation/widgets/best_office_widget/best_office_widget.dart';
import 'package:home4u/features/user/home/presentation/widgets/best_show_rooms_widget/best_show_rooms_widget.dart';
import 'package:home4u/features/user/home/presentation/widgets/business_types_widget.dart';
import 'package:home4u/features/user/home/presentation/widgets/home_header_widget.dart';
import 'package:home4u/features/user/home/presentation/widgets/recommended_for_you/recommended_for_you_widget.dart';
import 'package:home4u/features/user/home/presentation/widgets/services_widget/services_widget.dart';
import 'package:home4u/features/user/home/presentation/widgets/today_offer-widget/today_offers_widget.dart';

class UserHomeScreen extends StatelessWidget {
  const UserHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              HomeHeaderWidget(),
              verticalSpace(16),
              TodayOffersWidget(),
              BusinessTypesWidget(),
              ServicesWidget(),
              RecommendedForYouWidget(),
              BestOfficeWidget(),
              BestShowRoomsWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
