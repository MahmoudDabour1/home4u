import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/utils/spacing.dart';
import 'package:home4u/features/cart/presentation/widgets/cart_order_details_widgets/cart_order_details_content.dart';
import 'package:home4u/features/cart/presentation/widgets/cart_order_details_widgets/cart_order_details_header.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 32.h, left: 24.w, right: 24.w),
            child: Column(
              children: [
                const CartOrderDetailsHeader(),
                verticalSpace(16),
                const CartOrderDetailsContent(),
                verticalSpace(16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
