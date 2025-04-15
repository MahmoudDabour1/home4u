import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../../locale/app_locale.dart';
import '../../../data/models/product_preview_response.dart';

class ProductDetailsDataContent extends StatelessWidget {
  final ProductPreviewResponse previewData;

  const ProductDetailsDataContent({super.key, required this.previewData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0).w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16.h,
        children: [
          _buildProductKeyValue(
            key: AppLocale.name.getString(context),
            value: previewData.data.nameEn,
          ),
          _buildProductKeyValue(
            key: AppLocale.description.getString(context),
            value: previewData.data.descriptionEn,
          ),
          _buildProductKeyValue(
            key: AppLocale.material.getString(context),
            value: previewData.data.materials.map((e) => e.name).join(', '),
          ),
          _buildProductKeyValue(
            key: AppLocale.dimensions.getString(context),
            value:
                '${previewData.data.width} x ${previewData.data.height} x ${previewData.data.length}',
          ),
          _buildProductKeyValue(
            key: AppLocale.baseUnit.getString(context),
            value: previewData.data.baseUnit.name,
          ),
          Text("Colors && Stock", style: AppStyles.font16BlackBold),
          Wrap(
            spacing: 8.w,
            children: List.generate(previewData.data.stocks.length, (index) {
              return Chip(
                avatar: CircleAvatar(
                  radius: 16.r,
                  backgroundColor: _hexToColor(
                      '${previewData.data.stocks[index].color.hexColor}'),
                ),
                label: Text('${previewData.data.stocks[index].amount} pieces'),
                backgroundColor: AppColors.whiteColor,
              );
            }),
          )
        ],
      ),
    );
  }

  /// Convert hex color string to Color
  Color _hexToColor(String hex) {
    hex = hex.replaceFirst('#', '');
    return Color(int.parse('0xFF$hex'));
  }

  Widget _buildProductKeyValue({
    required String key,
    required String value,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$key:",
          style: AppStyles.font16BlackBold,
        ),
        Text(
          value,
          style: AppStyles.font16BlackLight,
        ),
      ],
    );
  }
}
