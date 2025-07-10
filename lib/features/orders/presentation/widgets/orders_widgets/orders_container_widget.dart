import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/extensions/navigation_extension.dart';
import 'package:home4u/core/routing/routes.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../core/widgets/app_custom_button.dart';
import '../../../data/models/orders_response_model.dart';
import 'order_row_item.dart';

class OrdersContainerWidget extends StatelessWidget {
  final OrderStatusCode orderStatus;

  final OrderDetails order;

  const OrdersContainerWidget({
    super.key,
    required this.orderStatus,
    required this.order,
  });

  String _getStatusText(OrderStatusCode status) {
    switch (status) {
      case OrderStatusCode.PENDING:
        return "PENDING";
      case OrderStatusCode.DELIVERED:
        return "DELIVERED";
      case OrderStatusCode.CANCELED:
        return "CANCELED";
    }
  }

  Color _getStatusColor(OrderStatusCode status) {
    switch (status) {
      case OrderStatusCode.PENDING:
        return Colors.orange;
      case OrderStatusCode.DELIVERED:
        return Colors.green;
      case OrderStatusCode.CANCELED:
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
                  "Order #${order.id}",
                  style: AppStyles.font20BlackMedium,
                ),
                Spacer(),
                Text(
                  formatDate(order.createdDate) ?? 'N/A',
                  style: AppStyles.font16BlueMedium,
                ),
              ],
            ),
            OrderRowItem(
              title: "Tracking number: ",
              value: order.orderNumber ?? "N/A",
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OrderRowItem(
                  title: "Quantity: ",
                  value: order.quantity.toString(),
                ),
                OrderRowItem(
                  title: "Subtotal: ",
                  value: "\$${order.price}",
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
                  onPressed: () {
                    context.pushNamed(
                      Routes.orderDetailsScreen,
                      arguments: {
                        'orderId': order.id,
                        'orderStatus': order.status.code,
                      },
                    );
                  },
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
