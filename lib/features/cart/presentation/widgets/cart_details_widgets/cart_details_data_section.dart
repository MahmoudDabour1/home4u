import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/locale/app_locale.dart';

import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/utils/spacing.dart';
import '../../../../products/data/models/product_preview_response.dart';
import 'animated_toggle_row.dart';
import 'cart_details_category_button_and_product_name.dart';
import 'cart_details_rating_and_buttons_row.dart';
import 'cart_product_ad_widget.dart';
import 'cart_product_back_button_and_search_field.dart';
import 'cart_product_details_colors_list_view.dart';
import 'cart_product_details_screen_carousel_slider.dart';

class CartDetailsDataSection extends StatelessWidget {
  final ProductPreviewResponse product;

  const CartDetailsDataSection({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CartProductBackButtonAndSearchField(),
          CartProductAdWidget(),
          CartDetailsCategoryButtonAndProductName(product: product),
          CartDetailsRatingAndButtonsRow(),
          verticalSpace(16),
          CartProductDetailsScreenCarouselSlider(
            useFancyImage: true,
            images: product.data.imagePaths.map((e) => e.imagePath).toList(),
          ),
          verticalSpace(32),
          RichText(
            text: TextSpan(
              text: AppLocale.egp.getString(context),
              style: AppStyles.font16BlackMedium,
              children: [
                TextSpan(
                  text: product.data.price.toString(),
                  style: AppStyles.font24BlackBold,
                ),
              ],
            ),
          ),
          verticalSpace(16),
          AnimatedToggleRow(
            textOne: "#1 on apple devices",
    ),
          verticalSpace(16),
          CartProductDetailsColorsListView(
            previewData: product,
          ),
          verticalSpace(16),
        ],
      ),
    );
  }
}
