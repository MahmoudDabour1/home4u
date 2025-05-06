import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/theming/app_colors.dart';
import 'package:home4u/core/theming/app_styles.dart';
import 'package:home4u/features/auth/sign_up/logic/sign_up_cubit.dart';
import 'package:home4u/features/cart/presentation/widgets/cart_categories_list_view.dart';
import 'package:home4u/features/cart/presentation/widgets/cart_filter_button.dart';
import 'package:home4u/features/cart/presentation/widgets/cart_grid_view.dart';
import 'package:home4u/features/cart/presentation/widgets/custom_choose_decor_or_furniture_items.dart';
import 'package:home4u/features/products/logic/products_cubit.dart';
import 'package:home4u/locale/app_locale.dart';

import '../../../core/utils/spacing.dart';
import '../../../core/widgets/app_custom_search_text_field.dart';
import '../logic/cart_cubit.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProductsCubit>().getBusinessConfig();
    context.read<CartCubit>().getCartProducts();
  }

  @override
  void dispose() {
    context.read<CartCubit>().resetPagination();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBusinessBackgroundColor,
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsetsDirectional.only(
              start: 24.w,
              end: 24.w,
              top: 48.h,
              bottom: 32.h,
            ),
            sliver: SliverToBoxAdapter(
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
                      CartFilterButton(),
                    ],
                  ),
                  verticalSpace(32),
                  Text(
                    AppLocale.categories.getString(context),
                    style: AppStyles.font20BlackMedium,
                  ),
                  verticalSpace(16.h),
                  CartCategoriesListView(),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(
              left: 24.w,
              right: 24.w,
              bottom: 32.h,
            ),
            sliver: SliverToBoxAdapter(child: CartGridView(),),
          ),
        ],
      ),
    );
  }
}
