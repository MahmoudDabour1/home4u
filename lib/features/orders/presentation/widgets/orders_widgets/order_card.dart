import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/utils/spacing.dart';

import '../../../../cart/data/models/order_model.dart';
import 'order_header.dart';


class OrderCard extends StatelessWidget {
  final OrdersModel order;
  const OrderCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(20.r),
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(15.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OrderHeader(order: order),
            verticalSpace(10),
            TrackingInfo(order: order),
            verticalSpace(10),
            // OrderSummary(order: order),
            verticalSpace(10),
            OrderStatusAndDetailsButton(order: order),
          ],
        ),
      ),
    );
  }
}
