import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/products/presentation/widgets/products_colors_and_rating.dart';
import 'package:home4u/features/products/presentation/widgets/products_first_text_and_buttons.dart';
import 'package:home4u/features/products/presentation/widgets/products_text_items.dart';

import '../../../../core/utils/spacing.dart';
import '../../data/models/products_response_model.dart';

class ProductsItemData extends StatelessWidget {
  final Content? content;
  final int? productIndex;

  const ProductsItemData({super.key, required this.content, this.productIndex});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          verticalSpace(16),
          ProductsFirstTextAndButtons(content: content,productIndex: productIndex,),
          ProductsTextItems(content: content,),
          ProductsColorsAndRating(content: content,),
        ],
      ),
    );
  }
}
