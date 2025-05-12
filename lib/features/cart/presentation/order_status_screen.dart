import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/cart/presentation/widgets/order_status_widgets/order_status_buttons.dart';
import 'package:home4u/features/cart/presentation/widgets/order_status_widgets/order_status_card.dart';
import 'package:home4u/features/cart/presentation/widgets/order_status_widgets/order_status_header.dart';
import 'package:home4u/features/cart/presentation/widgets/order_status_widgets/order_status_order_details.dart';
import 'package:home4u/features/cart/presentation/widgets/order_status_widgets/order_status_order_prices.dart';

import '../../../core/utils/spacing.dart';

class OrderStatusScreen extends StatelessWidget {
  const OrderStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFAFAFA),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                OrderStatusHeader(),
                verticalSpace(32),
                OrderStatusCard(),
                verticalSpace(26),
                OrderStatusOrderDetails(),
                verticalSpace(40),
                OrderStatusOrderPrices(),
                verticalSpace(40),
                OrderStatusButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
