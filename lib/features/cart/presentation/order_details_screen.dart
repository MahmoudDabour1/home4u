import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/utils/spacing.dart';
import 'package:home4u/features/cart/presentation/widgets/order_details_widgets/order_details_content.dart';
import 'package:home4u/features/cart/presentation/widgets/order_details_widgets/order_details_header.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 32.h, left: 24.w, right: 24.w),
            child: Column(
              children: [
                const OrderDetailsHeader(),
                verticalSpace(32),
                const OrderDetailsContent(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

