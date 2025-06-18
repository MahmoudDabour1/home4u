import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/utils/spacing.dart';
import 'order_details_screen_row_item.dart';

class OrderDetailsOrderPrices extends StatelessWidget {
  const OrderDetailsOrderPrices({
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
            OrderDetailsScreenRowItem(
              title: "Maxi Dress",
              value: "\$68.00",
              isHaveAmount: true,
              amount: "x1",
            ),
            OrderDetailsScreenRowItem(
              title: "Linen Dress",
              value: "\$52.00",
              isHaveAmount: true,
              amount: "x1",
            ),
            verticalSpace(16),
            OrderDetailsScreenRowItem(
              title: "Sub Total",
              value: "120.00",
            ),
            OrderDetailsScreenRowItem(
              title: "Shipping",
              value: "0.00",
            ),
            Divider(),
            OrderDetailsScreenRowItem(
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
