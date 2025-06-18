import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/widgets/app_custom_button.dart';
import 'order_row_item.dart';

class OrdersContainerWidget extends StatelessWidget {
  final OrderStatus orderStatus;


  const OrdersContainerWidget({super.key, required this.orderStatus});

  String _getStatusText(OrderStatus status) {
    switch (status) {
      case OrderStatus.pending:
        return "PENDING";
      case OrderStatus.delivered:
        return "DELIVERED";
      case OrderStatus.canceled:
        return "CANCELED";
    }
  }

  Color _getStatusColor(OrderStatus status) {
    switch (status) {
      case OrderStatus.pending:
        return Colors.orange;
      case OrderStatus.delivered:
        return Colors.green;
      case OrderStatus.canceled:
        return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.blackColor.withValues(alpha: 0.1),
            blurRadius: 10,
            spreadRadius: 1,
            offset: const Offset(0, 4),
          ),
        ],
        borderRadius: BorderRadius.circular(20.r),
        color: AppColors.whiteColor,
        border: BoxBorder.lerp(
          Border.all(color: AppColors.blackColor.withValues(alpha: 0.1)),
          Border.all(color: AppColors.blackColor.withValues(alpha: 0.1)),
          1,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 24.h,
          children: [
            Row(
              children: [
                Text(
                  "Order #1514",
                  style: AppStyles.font20BlackMedium,
                ),
                Spacer(),
                Text(
                  "13/05/2021",
                  style: AppStyles.font16BlueMedium,
                ),
              ],
            ),
            OrderRowItem(
              title: "Tracking number: ",
              value: " IK987362341",
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OrderRowItem(
                  title: "Quanlity: ",
                  value: "3",
                ),
                OrderRowItem(
                  title: "Subtotal: ",
                  value: "\$110",
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  _getStatusText(orderStatus),
                  style: AppStyles.font16DarkBlueRegular.copyWith(
                    color: _getStatusColor(orderStatus),
                  ),
                ),
                Spacer(),
                AppCustomButton(
                  textButton: "Details",
                  btnWidth: 100.w,
                  btnHeight: 35.h,
                  onPressed: () {},
                  isBorder: true,
                  radius: 25.r,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

enum OrderStatus {
  pending,
  delivered,
  canceled,
}
