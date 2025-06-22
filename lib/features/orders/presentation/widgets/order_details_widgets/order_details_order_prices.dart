import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/orders/data/models/order_details_response_model.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/utils/spacing.dart';
import 'order_details_screen_row_item.dart';

class OrderDetailsOrderPrices extends StatelessWidget {
  final OrderDetailsResponseModel order;

  const OrderDetailsOrderPrices({
    super.key,
    required this.order,
  });

  double get subtotal {
    return order.data.orderDetails
        .fold(0.0, (sum, item) => sum + (item.price * item.amount));
  }

  double get shipping => 0.0;

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
            ...order.data.orderDetails.map((item) {
              return OrderDetailsScreenRowItem(
                title: item.product.name,
                amount: "x${item.amount.toInt()}",
                isHaveAmount: true,
                value: "\$${item.price.toStringAsFixed(2)}",
              );
            }),
            verticalSpace(16),
            OrderDetailsScreenRowItem(
              title: "Sub Total",
              value: "\$${subtotal.toStringAsFixed(2)}",
            ),
            OrderDetailsScreenRowItem(
              title: "Shipping",
              value: "\$${shipping.toStringAsFixed(2)}",
            ),
            Divider(),
            OrderDetailsScreenRowItem(
              title: "Total",
              value: "\$${order.data.totalPrice.toStringAsFixed(2)}",
            ),
            verticalSpace(16),
          ],
        ),
      ),
    );
  }
}
