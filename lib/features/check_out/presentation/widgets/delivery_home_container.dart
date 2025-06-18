import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/check_out/presentation/widgets/shipping_methods_container_texts.dart';

import '../../../../core/theming/app_colors.dart';

class DeliveryHomeContainer extends StatelessWidget {
  const DeliveryHomeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75.h,
      decoration: BoxDecoration(
        color: AppColors.lightGrayColor,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.symmetric(
          horizontal: BorderSide(
            color: AppColors.lightGrayColor,
            width: 1.w,
          ),
        ),
      ),
      child: Center(
        child: Row(
          children: [
            Radio.adaptive(
              value: null,
              groupValue: null,
              onChanged: null,
              activeColor: Colors.green,
              splashRadius: 50.r,
              fillColor: WidgetStateProperty.all(Colors.green),
            ),
            ShippingMethodsContainerTexts(),
          ],
        ),
      ),
    );
  }
}
