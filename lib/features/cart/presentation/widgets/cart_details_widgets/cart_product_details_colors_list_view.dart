import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/theming/app_styles.dart';
import 'package:home4u/core/utils/spacing.dart';
import 'package:home4u/locale/app_locale.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../products/data/models/product_preview_response.dart';

class CartProductDetailsColorsListView extends StatefulWidget {
  final ProductPreviewResponse previewData;

  const CartProductDetailsColorsListView({
    super.key,
    required this.previewData,
  });

  @override
  State<CartProductDetailsColorsListView> createState() =>
      _CartProductDetailsColorsListViewState();
}

class _CartProductDetailsColorsListViewState
    extends State<CartProductDetailsColorsListView> {
  int _selectedColorIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${AppLocale.color.getString(context)}: ${widget.previewData.data.stocks[_selectedColorIndex].color.name}",
          style: AppStyles.font16BlackBold,
        ),
        verticalSpace(8),
        Wrap(
          children: [
            ...List.generate(
              widget.previewData.data.stocks.length,
              (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedColorIndex = index;
                    });
                  },
                  child: Container(
                    width: 40.w,
                    height: 40.h,
                    margin: EdgeInsetsDirectional.only(end: 8.w),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: _selectedColorIndex == index
                            ? AppColors.blueColor
                            : AppColors.grayColor,
                        width: 2.w,
                      ),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Center(
                      child: Container(
                        width: 30.w,
                        height: 30.h,
                        decoration: BoxDecoration(
                          color: _hexToColor(
                            widget.previewData.data.stocks[index].color
                                    .hexColor ??
                                '',
                          ),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
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
