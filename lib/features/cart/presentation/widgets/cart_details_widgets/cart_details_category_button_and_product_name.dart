import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home4u/core/theming/app_colors.dart';

import '../../../../../core/localization/app_localization_cubit.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/utils/spacing.dart';
import '../../../../products/data/models/product_preview_response.dart';
import 'expandable_text.dart';

class CartDetailsCategoryButtonAndProductName extends StatelessWidget {
  final ProductPreviewResponse product;

  const CartDetailsCategoryButtonAndProductName(
      {super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final appLocaleCubit = context.read<AppLocalizationCubit>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        verticalSpace(16),
        GestureDetector(
          onTap: () {},
          child: Text(
            product.data.businessType.name??'',
            style: AppStyles.font20WhiteBold.copyWith(
              color: AppColors.lightBlueColor,
            ),
          ),
        ),
        verticalSpace(8),
        ExpandableText(
          text: appLocaleCubit.textDirection == TextDirection.ltr
              ? product.data.nameEn
              : product.data.nameAr,
          textStyle: AppStyles.font20BlackMedium,
          maxLines: 2,
          isArrow: true,
        ),
        verticalSpace(8),
      ],
    );
  }
}
