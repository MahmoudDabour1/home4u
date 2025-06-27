import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/utils/spacing.dart';
import '../../../../../locale/app_locale.dart';
import '../../../../products/data/models/product_preview_response.dart';

class SpecificationsSection extends StatelessWidget {
  final ProductPreviewResponse product;

  const SpecificationsSection({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSpecRow(
          index: 1,
          title: AppLocale.businessType.getString(context),
          value: product.data.businessType.name ?? '',
        ),
        _buildSpecRow(
          index: 2,
          title: AppLocale.categories.getString(context),
          value: product.data.businessTypeCategory?.name ?? 'N/A',
        ),
        _buildSpecRow(
          index: 3,
          title: AppLocale.dimensions.getString(context),
          value:
              "${product.data.length} * ${product.data.width} * ${product.data.height}",
        ),
        _buildSpecRow(
          index: 4,
          title: AppLocale.unitType.getString(context),
          value: product.data.baseUnit.name ?? "",
        ),
        _buildSpecRow(
          index: 5,
          title: AppLocale.stock.getString(context),
          value: "${product.data.stocks.length}",
        ),
        verticalSpace(16),
      ],
    );
  }

  Widget _buildSpecRow({
    required int index,
    required String title,
    required String value,
  }) {
    final bool isEven = index % 2 == 0;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
      margin: EdgeInsets.only(bottom: 4.0),
      decoration: BoxDecoration(
        color: isEven ? AppColors.lighterBlueColor : AppColors.whiteColor,
        borderRadius:
            isEven ? BorderRadius.circular(4.r) : BorderRadius.circular(0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: Text(
              title,
              style: AppStyles.font16GrayMedium,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              value,
              style: AppStyles.font16BlackMedium,
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }
}
