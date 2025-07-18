import 'package:flutter/material.dart';
import 'package:home4u/core/theming/app_styles.dart';

class OrderDetailsScreenRowItem extends StatelessWidget {
  final String title;
  final String value;
  final bool isHaveAmount;
  final String? amount;

  const OrderDetailsScreenRowItem({
    super.key,
    required this.title,
    required this.value,
    this.isHaveAmount = false,
    this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ///ToDo : Expected Overflow here
        Text(
          title,
          style: AppStyles.font16GrayLight,
        ),
        isHaveAmount ? Spacer() : SizedBox.shrink(),
        isHaveAmount
            ? Text(
                amount!,
                style: AppStyles.font16BlackMedium,
              )
            : SizedBox.shrink(),
        Spacer(),
        Text(
          value,
          style: AppStyles.font16BlackMedium,
        ),
      ],
    );
  }
}
