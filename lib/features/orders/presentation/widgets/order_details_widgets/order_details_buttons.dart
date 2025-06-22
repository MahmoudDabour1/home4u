import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/extensions/navigation_extension.dart';

import '../../../../../core/routing/routes.dart';
import '../../../../../core/utils/spacing.dart';
import '../../../../../core/widgets/app_custom_button.dart';
import '../../../data/models/orders_response_model.dart';

class OrderDetailsButtons extends StatelessWidget {
  final OrderStatusCode orderStatusCode;

  const OrderDetailsButtons({
    super.key,
    required this.orderStatusCode,
  });

  @override
  Widget build(BuildContext context) {
    return switch(orderStatusCode){
      OrderStatusCode.PENDING => _buildOrderPendingButtons(context),
      OrderStatusCode.DELIVERED => _buildOrderDeliveredButtons(),
      OrderStatusCode.CANCELED => const SizedBox.shrink(),
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

  Widget _buildOrderPendingButtons(BuildContext context) {
    return AppCustomButton(
      textButton: "Continue Shipping",
      btnWidth: MediaQuery.sizeOf(context).width,
      btnHeight: 50.h,
      onPressed: () => context.pushNamed(Routes.cartScreen),
    );
  }
}
