import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/theming/app_styles.dart';

import '../../../../cart/data/models/order_model.dart';

class OrderHeader extends StatelessWidget {
  final OrdersModel order;
  const OrderHeader({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();
    String dateStr = "${today.day}-${today.month}-${today.year}";

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Order #${order.getOrderNumber()}",
            style: AppStyles.font20BlackMedium),
        Text(dateStr, style: AppStyles.font16BlackLight),
      ],
    );
  }
}

class TrackingInfo extends StatelessWidget {
  final OrdersModel order;
  const TrackingInfo({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("Tracking number:", style:AppStyles.font16BlackLight),
        Text(" ${order.getTrackingNumber()}",
            style:  TextStyle(fontSize: 20.sp)),
      ],
    );
  }
}

class OrderStatusAndDetailsButton extends StatelessWidget {
  final OrdersModel order;
  const OrderStatusAndDetailsButton({required this.order});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        OrderStatus(order: order),
        // DetailsButton(order: order),
      ],
    );
  }
}

class OrderStatus extends StatelessWidget {
  final OrdersModel order;
  const OrderStatus({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Text(
      order is OrderPending
          ? "Pending"
          : order is OrderDelivered
              ? "Delivered"
              : "Canceled",
      style: TextStyle(
        color: order is OrderPending
            ? const Color(0xFFCF6112)
            : order is OrderDelivered
                ? const Color(0xFF009154)
                : const Color(0xFFC40000),
        fontSize: 20.sp,
      ),
    );
  }
}
