import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/app_styles.dart';



class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Center(
            child: Padding(
              padding: EdgeInsets.only(top: 26.h, right: 35.w),
              child: Text(
                'My Orders',
                style: AppStyles.font24BlackBold,
              ),
            ),
          ),
          backgroundColor: Colors.white,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(70),
            child: SizedBox(
              height: 40.h,
              child: TabBar(
                dividerHeight: 0.h,
                labelPadding:EdgeInsetsDirectional.symmetric(horizontal: 16.w),
                indicator: BoxDecoration(
                  color: Color(0xFF43484B),
                  borderRadius: BorderRadius.circular(30.r),
                ),
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: Colors.transparent,
                tabs: [
                  // Tab(child: buildTabItem(TabTitles.pending)),
                  // Tab(child: buildTabItem(TabTitles.delivered)),
                  // Tab(child: buildTabItem(TabTitles.canceled)),
                ],
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            // buildTabContent<OrderPending>(context),
            // buildTabContent<OrderDelivered>(context),
            // buildTabContent<OrderCanceled>(context),
          ],
        ),
      ),
    );
  }
}
class TabTitles {
  static const String pending = "Pending";
  static const String delivered = "Delivered";
  static const String canceled = "Canceled";
}

