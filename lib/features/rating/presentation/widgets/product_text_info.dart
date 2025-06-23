import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_styles.dart';
import '../../../../core/utils/spacing.dart';

class ProductTextInfo extends StatelessWidget {
  final String productName;
  final String deliveryAddress;

  const ProductTextInfo({
    super.key,
    required this.productName,
    required this.deliveryAddress,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          productName,
          style: AppStyles.font16BlackMedium,
        ),
        verticalSpace(8),
        Text(
          "Delivered to $deliveryAddress",
          style: TextStyle(
            fontSize: 14.sp,
            color: Colors.grey[700],
          ),
        ),
      ],
    );
  }
}
