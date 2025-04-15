import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/theming/app_colors.dart';
import 'package:home4u/core/theming/app_styles.dart';
import 'package:home4u/features/cart/presentation/widgets/cart_categories_list_view.dart';
import 'package:home4u/features/cart/presentation/widgets/cart_grid_view.dart';
import 'package:home4u/features/cart/presentation/widgets/custom_choose_decor_or_furniture_items.dart';
import 'package:home4u/locale/app_locale.dart';

import '../../../core/utils/spacing.dart';
import '../../../core/widgets/app_custom_search_text_field.dart';
import '../../products/presentation/widgets/filter/products_filter_button.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBusinessBackgroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsetsDirectional.only(
              start: 24.w,
              end: 24.w,
              top: 28.h,
              bottom: 32.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  spacing: 16.w,
                  children: [
                    Expanded(
                      child: AppCustomSearchTextField(
                        controller: TextEditingController(),
                        onChanged: (value) {},
                      ),
                    ),
                    ProductsFilterButton(),
                  ],
                ),
                verticalSpace(32),
                Text(
                  AppLocale.categories.getString(context),
                  style: AppStyles.font20BlackMedium,
                ),
                verticalSpace(16.h),
                CartCategoriesListView(),
                verticalSpace(32.h),
                CustomChooseDecorOrFurnitureItems(),
                verticalSpace(32.h),
                CartGridView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
