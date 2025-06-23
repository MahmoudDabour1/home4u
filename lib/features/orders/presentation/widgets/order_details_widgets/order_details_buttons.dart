import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/extensions/navigation_extension.dart';
import 'package:home4u/core/routing/routes.dart';
import 'package:home4u/features/orders/data/models/order_details_response_model.dart';
import 'package:home4u/features/orders/presentation/widgets/order_details_widgets/cancel_order_bloc_builder_button.dart';
import 'package:home4u/features/orders/presentation/widgets/order_details_widgets/delivered_order_rating_button.dart';

import '../../../../../core/utils/spacing.dart';
import '../../../../../core/widgets/app_custom_button.dart';
import '../../../data/models/orders_response_model.dart';

class OrderDetailsButtons extends StatelessWidget {
  final OrderStatusCode orderStatusCode;
  final OrderDetailsResponseModel orderDetails;
  final int orderId;

  const OrderDetailsButtons({
    super.key,
    required this.orderStatusCode,
    required this.orderDetails,
    required this.orderId,
  });

  @override
  Widget build(BuildContext context) {
    return switch (orderStatusCode) {
      OrderStatusCode.PENDING => _buildOrderPendingButtons(context),
      OrderStatusCode.DELIVERED => _buildOrderDeliveredButtons(context),
      OrderStatusCode.CANCELED => _buildOrderCanceledButtons(context),
    };
  }

  Widget _buildOrderDeliveredButtons(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AppCustomButton(
            textButton: "Return home",
            btnWidth: 143.w,
            btnHeight: 50.h,
            isBorder: true,
            onPressed: () => context.pushNamed(Routes.userHomeScreen),
          ),
        ),
        horizontalSpace(16),
        DeliveredOrderRatingButton(orderDetails: orderDetails),
      ],
    );
  }

  Widget _buildOrderPendingButtons(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AppCustomButton(
            textButton: "Continue Shipping",
            btnWidth: 150.w,
            btnHeight: 60.h,
            isBorder: true,
            onPressed: () => context.pushNamed(Routes.cartScreen),
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
            onPressed: () => context.pushNamed(Routes.userHomeScreen),
          ),
        ),
      ],
    );
  }
}
