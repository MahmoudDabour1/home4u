import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/cart/presentation/widgets/cart_order_details_widgets/cart_checkout_section_app_custom_button.dart';
import 'package:home4u/features/cart/presentation/widgets/cart_order_details_widgets/promo_code_input.dart';
import 'package:home4u/features/cart/presentation/widgets/cart_order_details_widgets/total_price_row.dart';

import '../../../../../core/utils/spacing.dart';

class CheckoutSection extends StatelessWidget {
  final double total;

  const CheckoutSection({
    super.key,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(16.h),
        const PromoCodeInput(),
        verticalSpace(16.h),
        TotalPriceRow(total: total),
        verticalSpace(16.h),
        CartCheckoutSectionAppCustomButton(),
        verticalSpace(16.h),
      ],
    );
  }
}
