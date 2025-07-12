import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/theming/app_colors.dart';
import 'package:home4u/features/orders/presentation/widgets/order_details_widgets/order_details_status_card.dart';

import '../../../data/models/orders_response_model.dart';

class OrderDetailsCard extends StatelessWidget {
  final OrderStatusCode orderDetailsStatusCode;

  const OrderDetailsCard({
    super.key,
    required this.orderDetailsStatusCode,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Card(
        color: AppColors.secondaryGradientColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: OrderDetailsStatusCard(
          orderStatusCode: orderDetailsStatusCode,
        ),
      ),
    );
  }
}
