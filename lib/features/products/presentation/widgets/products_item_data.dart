import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/products/presentation/widgets/products_colors_and_rating.dart';
import 'package:home4u/features/products/presentation/widgets/products_first_text_and_buttons.dart';
import 'package:home4u/features/products/presentation/widgets/products_text_items.dart';

import '../../../../core/utils/spacing.dart';

class ProductsItemData extends StatelessWidget {
  const ProductsItemData({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          verticalSpace(16),
          ProductsFirstTextAndButtons(),
          ProductsTextItems(),
          ProductsColorsAndRating(),
        ],
      ),
    );
  }
}
