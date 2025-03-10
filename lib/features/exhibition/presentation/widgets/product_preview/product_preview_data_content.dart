import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/app_styles.dart';
import '../../../../../locale/app_locale.dart';

class ProductPreviewDataContent extends StatelessWidget {
  final Map<String, dynamic> previewData;

  const ProductPreviewDataContent({super.key, required this.previewData});

  @override
  Widget build(BuildContext context) {
    String? selectedColorId;
    final List<Map<String, dynamic>> selectedColorsAndStock = [];
    // final businessCubit = context.read<BusinessAddProductCubit>();
    // final productsCubit = context.read<ProductsCubit>();


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
            value: previewData['productName'],
          ),

          _buildProductKeyValue(
            key: AppLocale.description.getString(context),
            value: previewData['productDescription'],
          ),
          _buildProductKeyValue(
            key: AppLocale.material.getString(context),
            value: previewData['productMaterial'],
          ),
          _buildProductKeyValue(
            key: AppLocale.dimensions.getString(context),
            value: previewData['productDimensions'],
          ),
          _buildProductKeyValue(
            key: AppLocale.baseUnit.getString(context),
            value: previewData['baseUnit'],
          ),
          Text("Colors && Stock", style: AppStyles.font16BlackBold),
          // Wrap(
          //   spacing: 8.w,
          //   children: selectedColorsAndStock.map((item) {
          //     final colorHex = item["hexColor"];
          //     return Chip(
          //       avatar: CircleAvatar(
          //         radius: 16.r,
          //         backgroundColor: _hexToColor(colorHex),
          //       ),
          //       label: Text('${item["stock"]} pieces'),
          //       backgroundColor: AppColors.whiteColor,
          //     );
          //   }).toList(),
          // ),
          // _buildProductKeyValue(
          //   key: AppLocale.stock.getString(context),
          //   value: previewData['productStock'],
          // ),
        ],
      ),
    );
  }

  Color _hexToColor(String hex) {
    hex = hex.replaceFirst('#', '');
    return Color(int.parse('0xFF$hex'));
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
