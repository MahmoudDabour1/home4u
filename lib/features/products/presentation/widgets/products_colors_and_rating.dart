import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/theming/app_colors.dart';
import 'package:home4u/features/products/presentation/widgets/products_custom_color_container.dart';

import '../../../../core/theming/app_assets.dart';
import '../../../../core/theming/app_styles.dart';
import '../../../../core/utils/spacing.dart';
import '../../../../core/widgets/app_custom_icon_button.dart';

class ProductsColorsAndRating extends StatelessWidget {
  const ProductsColorsAndRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            ProductsCustomColorContainer(text: "Gray"),
            horizontalSpace(16),
            ProductsCustomColorContainer(text: "Red"),
            AppCustomIconButton(
              image: AppAssets.arrowRightBlackSvg,
              width: 15.w,
              height: 15.h,
              onPressed: () {},
            ),
          ],
        ),
        Row(
          children: [
            Text(
              "4.5",
              style: AppStyles.font14BlackLight,
            ),
            horizontalSpace(4),
            Icon(
              Icons.star,
              color: AppColors.yellowColor,
            ),
          ],
        ),
      ],
    );
  }
}
