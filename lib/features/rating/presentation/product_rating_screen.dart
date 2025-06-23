import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/widgets/app_custom_button.dart';
import 'package:home4u/features/auth/widgets/auth_welcome_data.dart';
import 'package:home4u/features/rating/presentation/widgets/product_rating_info_section.dart';
import 'package:home4u/features/rating/presentation/widgets/product_info_section.dart';
import 'package:home4u/locale/app_locale.dart';

import '../../../core/utils/spacing.dart';
import '../../orders/data/models/order_details_response_model.dart';

class ProductRatingScreen extends StatelessWidget {
  final String deliveryAddress;
  final Product product;

  const ProductRatingScreen({
    super.key,
    required this.deliveryAddress,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AuthWelcomeData(
                headText: "Product Preview",
                subText: "",
              ),
              verticalSpace(16),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0.w),
                child: ProductInfoSection(
                  deliveryAddress: deliveryAddress,
                  product: product,
                ),
              ),
              verticalSpace(32),
              ProductRatingInfoSection(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0).w,
                child: AppCustomButton(
                  textButton: AppLocale.submit.getString(context),
                  btnWidth: MediaQuery.sizeOf(context).width,
                  btnHeight: 50.h,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
