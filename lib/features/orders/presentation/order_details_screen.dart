import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:home4u/features/orders/presentation/widgets/order_details_widgets/order_details_buttons.dart';
import 'package:home4u/features/orders/presentation/widgets/order_details_widgets/order_details_card.dart';
import 'package:home4u/features/orders/presentation/widgets/order_details_widgets/order_details_header.dart';
import 'package:home4u/features/orders/presentation/widgets/order_details_widgets/order_details_order_details.dart';
import 'package:home4u/features/orders/presentation/widgets/order_details_widgets/order_details_order_prices.dart';

import '../../../core/utils/spacing.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

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
                OrderDetailsHeader(),
                verticalSpace(32),
                OrderDetailsCard(),
                verticalSpace(26),
                OrderDetailsOrderDetails(),
                verticalSpace(40),
                OrderDetailsOrderPrices(),
                verticalSpace(40),
                OrderDetailsButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
