import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/utils/spacing.dart';
import 'order_status_screen_row_item.dart';

class OrderStatusOrderPrices extends StatelessWidget {
  const OrderStatusOrderPrices({
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
              title: "Maxi Dress",
              value: "\$68.00",
              isHaveAmount: true,
              amount: "x1",
            ),
            OrderStatusScreenRowItem(
              title: "Linen Dress",
              value: "\$52.00",
              isHaveAmount: true,
              amount: "x1",
            ),
            verticalSpace(16),
            OrderStatusScreenRowItem(
              title: "Sub Total",
              value: "120.00",
            ),
            OrderStatusScreenRowItem(
              title: "Shipping",
              value: "0.00",
            ),
            Divider(),
            OrderStatusScreenRowItem(
              title: "Total",
              value: "\$120.00",
            ),
            verticalSpace(16),
          ],
        ),
      ),
    );
  }
}
