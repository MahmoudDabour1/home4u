import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/utils/spacing.dart';
import 'package:home4u/features/products/data/models/products_response_model.dart';
import 'package:home4u/features/products/presentation/widgets/products_custom_row_wigdet.dart';
import 'package:home4u/locale/app_locale.dart';

import '../../../../core/theming/app_assets.dart';
import '../../../../core/theming/app_styles.dart';

class ProductsTextItems extends StatelessWidget {
  final Content? content;

  const ProductsTextItems({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8.h,
      children: [
        ProductsCustomRowWidget(
          title: content?.type ?? "-اثاث Furniture",
          iconImage: AppAssets.furnitureSvg,
        ),
        ProductsCustomRowWidget(
          title: "\$${content?.price}",
          iconImage: AppAssets.priceSvg,
          textStyle: AppStyles.font16BlueMedium,
        ),
        ProductsCustomRowWidget(
          title: "${AppLocale.stock}: ${content?.stockAmount}",
          iconImage: AppAssets.stockSvg,
        ),
        Text(
            "${AppLocale.dimensions}: ${content?.height}*${content?.width}*${content?.length}cm",
            style: AppStyles.font16GrayLight),
        verticalSpace(8),
      ],
    );
  }
}
