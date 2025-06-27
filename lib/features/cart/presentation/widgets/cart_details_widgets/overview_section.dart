import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/localization/app_localization_cubit.dart';
import '../../../../products/data/models/product_preview_response.dart';
import 'expandable_text.dart';

class OverviewSection extends StatelessWidget {
  final ProductPreviewResponse product;

  const OverviewSection({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final appLocaleCubit = context.read<AppLocalizationCubit>();

    return Padding(
      padding: EdgeInsets.all(8.0.w),
      child: SingleChildScrollView(
        child: ExpandableText(
          text: appLocaleCubit.textDirection == TextDirection.ltr
              ? product.data.descriptionEn
              : product.data.descriptionAr,
          maxLines: 8,
        ),
      ),
    );
  }
}
