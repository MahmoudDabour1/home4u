import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/theming/app_colors.dart';
import 'package:home4u/core/theming/app_styles.dart';
import 'package:home4u/core/widgets/app_back_button.dart';
import 'package:home4u/features/user/home/presentation/widgets/best_office_widget/best_office_widget.dart';
import 'package:home4u/features/user/home/presentation/widgets/best_show_rooms_widget/best_show_rooms_widget.dart';
import 'package:home4u/features/user/home/presentation/widgets/services_widget/services_widget.dart';
import 'package:home4u/features/user/home/presentation/widgets/today_offer-widget/today_offers_widget.dart';
import 'package:home4u/locale/app_locale.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocale.home.getString(context),
          style: AppStyles.font20WhiteBold.copyWith(
            color: AppColors.blackColor,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: AppBackButton(),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                TodayOffersWidget(),
                ServicesWidget(),
                BestOfficeWidget(),
                BestShowRoomsWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
