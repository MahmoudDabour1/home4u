import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/widgets/business_header_widget.dart';
import 'package:home4u/features/products/presentation/widgets/product_details/product_details_bloc_builder.dart';

import '../../../locale/app_locale.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
            spacing: 16.h,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BusinessHeaderWidget(headerTitle:AppLocale.productDetails.getString(context),
              isDrawer: false,
              isHasIcon: false,
              ),
              ProductDetailsBlocBuilder(),
            ],
          )),
    );
  }
}
