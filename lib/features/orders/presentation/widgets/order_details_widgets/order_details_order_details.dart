import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/theming/app_colors.dart';
import 'package:home4u/features/orders/data/models/order_details_response_model.dart';

import 'order_details_screen_row_item.dart';

class OrderDetailsOrderDetails extends StatelessWidget {
  final OrderDetailsResponseModel orderDetails;
  final int orderId;

  const OrderDetailsOrderDetails({
    super.key,
    required this.orderDetails,
    required this.orderId,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.blackColor.withValues(alpha: 0.1),
            blurRadius: 10,
            spreadRadius: 1,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(12.r),
        child: Column(
          spacing: 13.h,
          children: [
            OrderDetailsScreenRowItem(
              title: "Order number",
              value: "#$orderId",
            ),
            OrderDetailsScreenRowItem(
              title: "Tracking Number",
              value: orderDetails.data.orderNumber,
            ),
            OrderDetailsScreenRowItem(
              title: "Delivery address",
              value: orderDetails.data.deliveryAddress,
            ),
          ],
        ),
      ),
    );
  }
}
