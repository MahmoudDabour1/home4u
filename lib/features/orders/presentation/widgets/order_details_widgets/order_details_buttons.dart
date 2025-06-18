import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/spacing.dart';
import '../../../../../core/widgets/app_custom_button.dart';

class OrderDetailsButtons extends StatelessWidget {
  const OrderDetailsButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AppCustomButton(
            textButton: "Return home",
            btnWidth: 143.w,
            btnHeight: 40.h,
            isBorder: true,
            onPressed: () {},
          ),
        ),
        horizontalSpace(16),
        Expanded(
          child: AppCustomButton(
            textButton: "Rate",
            btnWidth: 143.w,
            btnHeight: 40.h,
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
