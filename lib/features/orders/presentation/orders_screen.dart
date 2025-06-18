import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/theming/app_styles.dart';
import 'package:home4u/features/orders/presentation/widgets/orders_widgets/order_delivered_section.dart';
import 'package:home4u/features/orders/presentation/widgets/orders_widgets/order_pending_section.dart';
import 'package:home4u/features/orders/presentation/widgets/orders_widgets/order_tab_bar_widget.dart';
import 'package:home4u/features/orders/presentation/widgets/orders_widgets/orders_canceled_section.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen>
    with SingleTickerProviderStateMixin {
  late TabController tapController;

  @override
  void initState() {
    super.initState();
    tapController = TabController(length: 3, vsync: this);
  }

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
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(40.h),
          child: OrderTabBarWidget(tapController: tapController),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            children: [
              Expanded(
                child: TabBarView(
                  controller: tapController,
                  children: [
                    OrderPendingSection(),
                    OrderDeliveredSection(),
                    OrdersCanceledSection(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
