import 'package:flutter/material.dart';
import 'package:home4u/core/theming/app_styles.dart';
import 'package:home4u/core/widgets/app_back_button.dart';

class OrderDetailsHeader extends StatelessWidget {
  final int orderId;
  const OrderDetailsHeader({
    super.key,
    required this.orderId,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppBackButton(),
        Spacer(),
        Text(
          "Order #$orderId",
          style: AppStyles.font20BlackMedium,
        ),
        Spacer(),
      ],
    );
  }
}
