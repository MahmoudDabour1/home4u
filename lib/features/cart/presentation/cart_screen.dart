import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/theming/app_colors.dart';
import 'package:home4u/core/theming/app_styles.dart';
import 'package:home4u/features/cart/presentation/widgets/cart_badge_button.dart';
import 'package:home4u/features/cart/presentation/widgets/cart_categories_list_view.dart';
import 'package:home4u/features/cart/presentation/widgets/cart_filter_button.dart';
import 'package:home4u/features/cart/presentation/widgets/cart_grid_view.dart';
import 'package:home4u/features/products/logic/products_cubit.dart';
import 'package:home4u/locale/app_locale.dart';

import '../../../core/utils/spacing.dart';
import '../../../core/widgets/app_custom_search_text_field.dart';
import '../logic/cart_cubit.dart';

class CartScreen extends StatefulWidget {
  final int? categoryIndex;
  const CartScreen({super.key, this.categoryIndex});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    context.read<CartCubit>().getCartProducts(isRefresh: true);
    _loadInitialData();
    _scrollController = ScrollController()..addListener(_scrollListener);
  }

  void _loadInitialData() {
    context.read<ProductsCubit>().getBusinessConfig();
    context.read<CartCubit>().refreshCart();
  }

  void _scrollListener() {
    final cubit = context.read<CartCubit>();

    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent * 0.7 &&
        !cubit.hasReachedMax) {
      cubit.getCartProducts();
    }
  }

  @override
  void dispose() {
    final cubit = context.read<CartCubit>();
    cubit.resetPagination();
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBusinessBackgroundColor,
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverPadding(
            padding: EdgeInsetsDirectional.only(
              start: 24.w,
              end: 24.w,
              top: 48.h,
              bottom: 16.h,
            ),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: AppCustomSearchTextField(
                          controller:
                              context.read<CartCubit>().searchController,
                          onChanged: (value) {
                            context
                                .read<CartCubit>()
                                .getCartProducts(isRefresh: true);
                          },
                        ),
                      ),
                      horizontalSpace(16),
                      CartFilterButton(),
                      horizontalSpace(8),
                      CartBadgeButton(),
                    ],
                  ),
                  verticalSpace(32),
                  Text(
                    AppLocale.categories.getString(context),
                    style: AppStyles.font20BlackMedium,
                  ),
                  verticalSpace(16.h),
                  CartCategoriesListView(categoryIndex: widget.categoryIndex,),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(
              left: 24.w,
              right: 24.w,
              bottom: 32.h,
              top: 0.h,
            ),
            sliver: CartGridView(),
          ),
        ],
      ),
    );
  }
}
