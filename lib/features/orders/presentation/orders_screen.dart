import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/theming/app_colors.dart';
import 'package:home4u/core/theming/app_styles.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Orders',
          style: AppStyles.font20BlackMedium,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          //tap bar
          DefaultTabController(
            length: 3,

            child: TabBar(
labelPadding: EdgeInsets.symmetric(horizontal: 16.w),
              physics: NeverScrollableScrollPhysics(),
              tabs:  [
                Tab(text: 'Pending'),
                Tab(text: 'Delivered'),
                Tab(text: 'Canceled'),
                // Tab(text: AppLocale.projects.getString(context)),
                // Tab(text: AppLocale.services.getString(context)),
                // Tab(text: AppLocale.about.getString(context)),
                // Tab(text: AppLocale.certifications.getString(context)),
              ],
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              isScrollable: false,
              enableFeedback: true,
              splashBorderRadius: BorderRadius.circular(16.r),
              tabAlignment: TabAlignment.center,
              dividerColor: Colors.transparent,
              labelColor: AppColors.whiteColor,
              labelStyle: AppStyles.font16BlackMedium.copyWith(
                color: AppColors.whiteColor,
              ),
              unselectedLabelColor: Colors.grey,
              unselectedLabelStyle: AppStyles.font16BlackLight,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(30.r),
                color: AppColors.secondaryColor,
              ),
                                ),
            ),

        ],
      )

      // DefaultTabController(
      //   length: 3,
      //   child: Scaffold(
      //     backgroundColor: Colors.white,
      //     appBar: AppBar(
      //       title: Center(
      //         child: Padding(
      //           padding: EdgeInsets.only(top: 26.h, right: 35.w),
      //           child: Text(
      //             'My Orders',
      //             style: AppStyles.font24BlackMedium,
      //           ),
      //         ),
      //       ),
      //       backgroundColor: Colors.white,
      //       bottom: PreferredSize(
      //         preferredSize: Size.fromHeight(70),
      //         child: SizedBox(
      //           height: 40.h,
      //           child: TabBar(
      //             dividerHeight: 0.h,
      //             labelPadding: 16,
      //             indicator: BoxDecoration(
      //               color: Color(0xFF43484B),
      //               borderRadius: BorderRadius.circular(30.r),
      //             ),
      //             indicatorSize: TabBarIndicatorSize.label,
      //             indicatorColor: Colors.transparent,
      //             tabs: [
      //               // TODO: Use constants or an enum for the tab titles to avoid hardcoding strings.
      //               Tab(child: buildTabItem(TabTitles.pending)),
      //               Tab(child: buildTabItem(TabTitles.delivered)),
      //               Tab(child: buildTabItem(TabTitles.canceled)),
      //             ],
      //             labelColor: Colors.white,
      //             unselectedLabelColor: Colors.black,
      //           ),
      //         ),
      //       ),
      //     ),
      //     body: TabBarView(
      //       children: [
      //         buildTabContent<OrderPending>(context),
      //         buildTabContent<OrderDelivered>(context),
      //         buildTabContent<OrderCanceled>(context),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
