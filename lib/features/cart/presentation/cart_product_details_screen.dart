import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/widgets/app_custom_loading_indicator.dart';
import 'package:home4u/features/cart/logic/cart_cubit.dart';
import 'package:home4u/features/cart/presentation/widgets/cart_details_widgets/cart_details_data_section.dart';
import 'package:home4u/features/cart/presentation/widgets/cart_details_widgets/cart_details_tap_bar.dart';
import 'package:home4u/features/cart/presentation/widgets/cart_details_widgets/cart_product_details_favorite_button.dart';
import 'package:home4u/features/cart/presentation/widgets/cart_details_widgets/rating/rating_reviews_widget.dart';
import 'package:home4u/features/cart/presentation/widgets/cart_details_widgets/rating/rating_section.dart';
import 'package:home4u/features/products/data/models/product_preview_response.dart';
import 'package:home4u/features/products/logic/products_cubit.dart';
import 'package:home4u/features/products/logic/products_state.dart';

import '../../../core/theming/app_colors.dart';
import '../../../core/utils/spacing.dart';
import '../../../core/widgets/app_custom_button.dart';
import '../../../locale/app_locale.dart';

class CartProductDetailsScreen extends StatefulWidget {
  final int productId;

  const CartProductDetailsScreen({super.key, required this.productId});

  @override
  State<CartProductDetailsScreen> createState() =>
      _CartProductDetailsScreenState();
}

class _CartProductDetailsScreenState extends State<CartProductDetailsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CartCubit>().getProductRate(10);
    context.read<CartCubit>().getRateReviews(productId:183);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Container(
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                CartProductDetailsFavoriteButton(),
                horizontalSpace(16),
                Expanded(
                  child: AppCustomButton(
                    btnHeight: 50.h,
                    btnWidth: 278.w,
                    textButton: AppLocale.addToCart.getString(context),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
        backgroundColor: AppColors.filledGrayColor,
        body: SafeArea(
          child: BlocBuilder<ProductsCubit, ProductsState>(
            builder: (context, state) {
              return state.maybeWhen(
                getProductPreviewLoading: () => setupLoading(),
                getProductPreviewSuccess: (product) {
                  return setupSuccess(product);
                },
                orElse: () => SizedBox(),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget setupLoading() {
    return AppCustomLoadingIndicator(
      loadingColor: AppColors.primaryColor,
    );
  }

  Widget setupSuccess(ProductPreviewResponse product) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CartDetailsDataSection(product: product),
          CartDetailsTapBar(product: product),
          verticalSpace(32),
          RatingSection(),
          RatingReviewsWidget(),
          verticalSpace(64),
          verticalSpace(32),
        ],
      ),
    );
  }
}
