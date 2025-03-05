import 'package:flutter/material.dart';

import '../../../../core/theming/app_assets.dart';
import '../../../../core/theming/app_styles.dart';
import '../../../../core/widgets/app_custom_icon_button.dart';

class ProductsFirstTextAndButtons extends StatelessWidget {
  const ProductsFirstTextAndButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Modern l-Shaped Sofa",
          style: AppStyles.font16BlackLight,
        ),
        Row(
          children: [
            AppCustomIconButton(
              onPressed: () {},
              image: AppAssets.editIconSvg,
            ),
            AppCustomIconButton(
              onPressed: () {},
              image: AppAssets.deleteIconSvg,
            ),
          ],
        ),
      ],
    );
  }
}
