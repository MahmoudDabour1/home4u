import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/utils/spacing.dart';

class CartOrderDetailsEmptyView extends StatelessWidget {
  const CartOrderDetailsEmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.65,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Icon(Icons.shopping_cart_outlined, size: 100.w, color: Colors.grey),
          verticalSpace(16.h),
          Text(
            "Cart Empty",
            style: AppStyles.font20BlackMedium,
          ),
          verticalSpace(32.h),
        ],
      ),
    );
  }
}
