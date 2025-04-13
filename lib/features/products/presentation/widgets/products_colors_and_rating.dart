import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/theming/app_colors.dart';
import 'package:home4u/features/products/data/models/products_response_model.dart'
as products;
import 'package:home4u/features/products/presentation/widgets/products_custom_color_container.dart';

import '../../../../core/theming/app_styles.dart';
import '../../../../core/utils/spacing.dart';

class ProductsColorsAndRating extends StatelessWidget {
  final products.Content? content;

  const ProductsColorsAndRating({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    Color hexToColor(String hex) {
      hex = hex.replaceFirst('#', '');
      return Color(int.parse('0xFF$hex'));
    }

    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ...List.generate(
            (content?.colors?.length ?? 0) > 7
                ? 7
                : content?.colors?.length ?? 0, (index) {
          return Padding(
            padding: EdgeInsetsDirectional.only(end: 8.w),
            child: ProductsCustomColorContainer(
              color: hexToColor(
                content?.colors?[index].hexColor.toString() ?? "",
              ),
            ),
          );
        }),
        Spacer(),
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
