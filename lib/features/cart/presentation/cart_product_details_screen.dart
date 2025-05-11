import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home4u/core/localization/app_localization_cubit.dart';
import 'package:home4u/features/cart/presentation/widgets/cart_details_widgets/cart_details_shimmer_widget.dart';
import 'package:home4u/features/cart/presentation/widgets/cart_details_widgets/cart_product_details_colors_list_view.dart';
import 'package:home4u/features/cart/presentation/widgets/cart_details_widgets/cart_product_details_favorite_button.dart';
import 'package:home4u/features/cart/presentation/widgets/cart_details_widgets/cart_product_details_screen_carousel_slider.dart';
import 'package:home4u/features/cart/presentation/widgets/cart_details_widgets/expandable_text.dart';
import 'package:home4u/features/cart/presentation/widgets/cart_details_widgets/plus_and_minus_controll_buttons.dart';
import 'package:home4u/features/products/logic/products_cubit.dart';
import 'package:home4u/features/products/logic/products_state.dart';

import '../../../core/theming/app_assets.dart';
import '../../../core/theming/app_colors.dart';
import '../../../core/theming/app_styles.dart';
import '../../../core/utils/spacing.dart';
import '../../../core/widgets/app_custom_button.dart';
import '../../../core/widgets/app_custom_loading_indicator.dart';
import '../../../locale/app_locale.dart';

class CartProductDetailsScreen extends StatelessWidget {
  const CartProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocBuilder<ProductsCubit, ProductsState>(
            builder: (context, state) {
              final appLocaleCubit = context.read<AppLocalizationCubit>();
              return state.maybeWhen(
                getProductPreviewLoading: () {
                  return CartDetailsShimmerWidget();
                },
                getProductPreviewSuccess: (product) {
                  return Column(
                    children: [
                      CartProductDetailsScreenCarouselSlider(
                        useFancyImage: true,
                        images: product.data.imagePaths
                            .map((e) => e.imagePath)
                            .toList(),
                      ),
                      verticalSpace(32),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: AutoSizeText(
                                    appLocaleCubit.textDirection ==
                                            TextDirection.ltr
                                        ? product.data.nameEn
                                        : product.data.nameAr,
                                    style: AppStyles.font24BlackMedium,
                                    maxLines: 5,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                // PlusAndMinusControllerButtons(),
                              ],
                            ),
                            verticalSpace(8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "\$${product.data.price.toString()}",
                                  style: AppStyles.font24BlackBold,
                                ),
                                Row(
                                  spacing: 8.w,
                                  children: [
                                    SvgPicture.asset(
                                      AppAssets.starSvgImage,
                                      width: 16.w,
                                      height: 16.h,
                                    ),
                                    Text(
                                      "4.5",
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        color: AppColors.blackColor,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            verticalSpace(16),
                            ExpandableText(
                              text: appLocaleCubit.textDirection ==
                                      TextDirection.ltr
                                  ? product.data.descriptionEn
                                  : product.data.descriptionAr,
                            ),
                            verticalSpace(16),
                            Text(
                              "${AppLocale.businessType.getString(context)} : ${product.data.businessType.name}",
                              style: AppStyles.font16BlackLight,
                            ),
                            verticalSpace(16),
                            Text(
                              "${AppLocale.categories.getString(context)} : ${product.data.businessTypeCategory?.name ?? 'N/A'}",
                              style: AppStyles.font16BlackLight,
                            ),
                            verticalSpace(16),
                            Text(
                              "${AppLocale.dimensions.getString(context)} : ${product.data.length}*${product.data.width}*${product.data.height}",
                              style: AppStyles.font16BlackLight,
                            ),
                            verticalSpace(16),
                            Text(
                              "${AppLocale.unitType.getString(context)} : ${product.data.baseUnit.name}",
                              style: AppStyles.font16BlackLight,
                            ),
                            verticalSpace(16),
                            Row(
                              spacing: 8.w,
                              children: [
                                SvgPicture.asset(
                                  AppAssets.stockSvg,
                                  width: 16.w,
                                  height: 16.h,
                                ),
                                Text(
                                  "${AppLocale.stock.getString(context)} : ${product.data.stocks.length}",
                                  style: AppStyles.font16BlackLight,
                                ),
                              ],
                            ),
                            verticalSpace(16),
                            CartProductDetailsColorsListView(
                              previewData: product,
                            ),
                            verticalSpace(32),
                            Row(
                              children: [
                                CartProductDetailsFavoriteButton(),
                                horizontalSpace(16),
                                Expanded(
                                  child: AppCustomButton(
                                    btnHeight: 50.h,
                                    btnWidth: 278.w,
                                    textButton:
                                        AppLocale.addToCart.getString(context),
                                    onPressed: () {},
                                  ),
                                ),
                              ],
                            ),
                            verticalSpace(32),
                          ],
                        ),
                      ),
                    ],
                  );
                },
                orElse: () => SizedBox(),
              );
            },
          ),
        ),
      ),
    );
  }
}
