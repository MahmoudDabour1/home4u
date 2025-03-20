import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/theming/app_colors.dart';
import 'package:home4u/features/products/presentation/widgets/products_custom_color_container.dart';

import '../../../../core/theming/app_assets.dart';
import '../../../../core/theming/app_styles.dart';
import '../../../../core/utils/spacing.dart';
import '../../../../core/widgets/app_custom_icon_button.dart';
import '../../data/models/products_response_model.dart';

class ProductsColorsAndRating extends StatelessWidget {
  final Content? content;

  const ProductsColorsAndRating({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Row(
              children: List.generate(
                  (content?.colors?.length ?? 0) > 2 ? 2 : (content?.colors?.length ?? 0),

                  (index) {
                return ProductsCustomColorContainer(
                    text: content?.colors?[index].name.toString() ?? "");
              }),
            ),
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
              content?.rate.toString() ?? '3.5',
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
