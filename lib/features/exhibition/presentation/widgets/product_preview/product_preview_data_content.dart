import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/app_styles.dart';
import '../../../../../locale/app_locale.dart';

class ProductPreviewDataContent extends StatelessWidget {
  const ProductPreviewDataContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0).w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16.h,
        children: [
          ///productName
          _buildProductKeyValue(
            key: AppLocale.name.getString(context),
            value: "Product Name",
          ),

          ///productColor
          _buildProductKeyValue(
            key: AppLocale.color.getString(context),
            value: "Product Color",
          ),

          ///productDescription
          _buildProductKeyValue(
            key: AppLocale.description.getString(context),
            value:
                "Flutter Gems is a platform that organizes over 5,500 Flutter packages into 175 categories, such as UI, state management, networking, and animations. This makes it easier for developers to find packages suited to their specific needs.",
          ),

          ///productMaterial
          _buildProductKeyValue(
            key: AppLocale.material.getString(context),
            value:
                "Product material refers to the substances or components used to create a product, which can include various materials like plastics, metals, wood, textiles, etc.",
          ),

          ///productDimensions
          _buildProductKeyValue(
            key: AppLocale.dimensions.getString(context),
            value: "height * width * depth",
          ),

          ///Base Unit
          _buildProductKeyValue(
            key: AppLocale.baseUnit.getString(context),
            value: "Piece",
          ),

          ///productStock
          _buildProductKeyValue(
            key: AppLocale.stock.getString(context),
            value: "Available 100 pieces",
          ),
        ],
      ),
    );
  }

  ///ToDo : Will be refactor later with api data
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
