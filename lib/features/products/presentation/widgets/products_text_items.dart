import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/products/presentation/widgets/products_custom_row_wigdet.dart';
import 'package:home4u/locale/app_locale.dart';

import '../../../../core/theming/app_assets.dart';
import '../../../../core/theming/app_styles.dart';

class ProductsTextItems extends StatelessWidget {
  const ProductsTextItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8.h,
      children: [
        ProductsCustomRowWidget(
          title: "-اثاث Furniture",
          iconImage: AppAssets.furnitureSvg,
        ),
        ProductsCustomRowWidget(
          title: "\$299.22",
          iconImage: AppAssets.priceSvg,
          textStyle: AppStyles.font16BlueMedium,
        ),
        ProductsCustomRowWidget(
          title: "${AppLocale.stock}: 100",
          iconImage: AppAssets.stockSvg,
        ),
        Text("${AppLocale.dimensions}: 280*180*85cm", style: AppStyles.font16GrayLight),
      ],
    );
  }
}
