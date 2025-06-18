
import 'package:flutter/material.dart';
import 'package:home4u/core/theming/app_styles.dart';
import 'package:home4u/core/utils/spacing.dart';

class ShippingMethodsContainerTexts extends StatelessWidget {
  const ShippingMethodsContainerTexts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Text(
              "Free",
              style: AppStyles.font16BlackBold,
            ),
            horizontalSpace(24),
            Text(
              "Delivery to home",
              style: AppStyles.font16GrayMedium,
            ),
          ],
        ),
        Text(
          "Delivery from 3 to 7 business days",
          style: AppStyles.font16GrayLight,
        ),
      ],
    );
  }
}
