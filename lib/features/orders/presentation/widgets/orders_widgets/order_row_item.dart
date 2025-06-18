import 'package:flutter/material.dart';

import '../../../../../core/theming/app_styles.dart';

class OrderRowItem extends StatelessWidget {
  final String title;
  final String value;

  const OrderRowItem({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: AppStyles.font16GrayMedium,
        ),
        Text(
          value,
          style: AppStyles.font16BlackBold,
        ),
      ],
    );
  }
}
