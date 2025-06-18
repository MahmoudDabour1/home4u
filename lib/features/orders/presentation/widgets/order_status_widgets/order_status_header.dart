import 'package:flutter/material.dart';
import 'package:home4u/core/theming/app_styles.dart';
import 'package:home4u/core/widgets/app_back_button.dart';

class OrderStatusHeader extends StatelessWidget {
  const OrderStatusHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppBackButton(),
        Spacer(),
        Text(
          "Order #1514",
          style: AppStyles.font20BlackMedium,
        ),
        Spacer(),
      ],
    );
  }
}
