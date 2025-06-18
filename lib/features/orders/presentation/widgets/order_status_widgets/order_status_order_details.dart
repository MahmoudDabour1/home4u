import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/theming/app_colors.dart';

import 'order_status_screen_row_item.dart';

class OrderStatusOrderDetails extends StatelessWidget {
  const OrderStatusOrderDetails({
    super.key,
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
            OrderStatusScreenRowItem(
              title: "Order number",
              value: "#1514",
            ),
            OrderStatusScreenRowItem(
              title: "Order number",
              value: "#1514",
            ),
            OrderStatusScreenRowItem(
              title: "Order number",
              value: "#1514",
            ),
          ],
        ),
      ),
    );
  }
}
