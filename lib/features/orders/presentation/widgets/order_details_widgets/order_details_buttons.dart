import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/orders/presentation/widgets/order_details_widgets/cancel_order_bloc_builder_button.dart';

import '../../../../../core/utils/spacing.dart';
import '../../../../../core/widgets/app_custom_button.dart';
import '../../../data/models/orders_response_model.dart';

class OrderDetailsButtons extends StatelessWidget {
  final OrderStatusCode orderStatusCode;
  final int orderId;

  const OrderDetailsButtons({
    super.key,
    required this.orderStatusCode,
    required this.orderId,
  });

  @override
  Widget build(BuildContext context) {
    return switch (orderStatusCode) {
      OrderStatusCode.PENDING => _buildOrderPendingButtons(),
      OrderStatusCode.DELIVERED => _buildOrderDeliveredButtons(),
      OrderStatusCode.CANCELED => _buildOrderCanceledButtons(context),
    };
  }

  Widget _buildOrderDeliveredButtons() {
    return Row(
      children: [
        Expanded(
          child: AppCustomButton(
            textButton: "Return home",
            btnWidth: 143.w,
            btnHeight: 50.h,
            isBorder: true,
            onPressed: () {},
          ),
        ),
        horizontalSpace(16),
        Expanded(
          child: AppCustomButton(
            textButton: "Rate",
            btnWidth: 143.w,
            btnHeight: 50.h,
            onPressed: () {},
          ),
        ),
      ],
    );
  }

  Widget _buildOrderPendingButtons() {
    return Row(
      children: [
        Expanded(
          child: AppCustomButton(
            textButton: "Continue Shipping",
            btnWidth: 150.w,
            btnHeight: 60.h,
            isBorder: true,
            onPressed: () {},
          ),
        ),
        horizontalSpace(16),
        CancelOrderBlocBuilderButton(orderId: orderId),
      ],
    );
  }

  Widget _buildOrderCanceledButtons(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AppCustomButton(
            textButton: "Return home",
            btnWidth: MediaQuery.of(context).size.width,
            btnHeight: 60.h,
            isBorder: true,
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
