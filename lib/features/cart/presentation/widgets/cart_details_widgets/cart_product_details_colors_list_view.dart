import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/theming/app_styles.dart';
import 'package:home4u/core/utils/spacing.dart';
import 'package:home4u/locale/app_locale.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../products/data/models/product_preview_response.dart';

class CartProductDetailsColorsListView extends StatelessWidget {
  final ProductPreviewResponse previewData;

  const CartProductDetailsColorsListView({
    super.key,
    required this.previewData,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Text(
          AppLocale.color.getString(context),
          style: AppStyles.font16BlackBold,
        ),
        horizontalSpace(16),
        ...List.generate(
          previewData.data.stocks.length,
          (index) {
            return Container(
              width: 30.w,
              height: 30.h,
              margin: EdgeInsetsDirectional.only(end: 8.w),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.grayColor,
                  width: 2.w,
                ),
              ),
              child: Center(
                child: Container(
                  width: 20.w,
                  height: 20.h,
                  decoration: BoxDecoration(
                    color: _hexToColor(
                      previewData.data.stocks[index].color.hexColor ?? '',
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  /// Convert hex color string to Color
  Color _hexToColor(String hex) {
    hex = hex.replaceFirst('#', '');
    return Color(int.parse('0xFF$hex'));
  }
}
