import 'package:flutter/material.dart';
import 'package:home4u/features/products/data/models/products_response_model.dart';

import '../../../../core/theming/app_assets.dart';
import '../../../../core/theming/app_styles.dart';
import '../../../../core/widgets/app_custom_icon_button.dart';
import 'product_delete_alert_dialog.dart';

class ProductsFirstTextAndButtons extends StatelessWidget {
  final Content? content;

  const ProductsFirstTextAndButtons({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          content!.name ?? "Modern l-Shaped Sofa",
          style: AppStyles.font16BlackLight,
        ),
        Row(
          children: [
            AppCustomIconButton(
              onPressed: () {},
              image: AppAssets.editIconSvg,
            ),
            AppCustomIconButton(
              onPressed: () => showDialog(
                builder: (context) => ProductDeleteAlertDialog(
                  productId: content?.id ?? 0,
                ),
                context: context,
              ),
              image: AppAssets.deleteIconSvg,
            ),
          ],
        ),
      ],
    );
  }
}
