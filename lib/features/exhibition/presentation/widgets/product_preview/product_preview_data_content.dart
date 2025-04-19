import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/theming/app_colors.dart';

import '../../../../../core/theming/app_styles.dart';
import '../../../../../locale/app_locale.dart';

class ProductPreviewDataContent extends StatelessWidget {
  final Map<String, dynamic> previewData;

  const ProductPreviewDataContent({super.key, required this.previewData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0).w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16.h,
        children: [
          /// Product Name
          _buildProductKeyValue(
            key: AppLocale.name.getString(context),
            value: previewData['productName'],
          ),

          /// Product Description
          _buildProductKeyValue(
            key: AppLocale.description.getString(context),
            value: previewData['productDescription'],
          ),

          /// Product Material
          _buildProductKeyValue(
            key: AppLocale.material.getString(context),
            value: previewData['productMaterial'],
          ),

          /// Product Dimensions
          _buildProductKeyValue(
            key: AppLocale.dimensions.getString(context),
            value: previewData['productDimensions'],
          ),

          /// Base Unit
          _buildProductKeyValue(
            key: AppLocale.baseUnit.getString(context),
            value: previewData['baseUnit'],
          ),

          /// Colors & Stock
          Text("Colors && Stock", style: AppStyles.font16BlackBold),
          Wrap(
            spacing: 8.w,
            children: (previewData['productStockAndColors'] as List<Map<String, dynamic>>).map((item) {
              final colorHex = item['hexColor'];
              final stock = item['stock'];
              return Chip(
                avatar: CircleAvatar(
                  radius: 16.r,
                  backgroundColor: _hexToColor(colorHex),
                ),
                label: Text('$stock pieces'),
                backgroundColor: AppColors.whiteColor,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  /// Convert hex color string to Color
  Color _hexToColor(String hex) {
       hex = hex.replaceFirst('#', '');
       return Color(int.parse('0xFF$hex'));
     }

  /// Build a key-value pair widgets
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