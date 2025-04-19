import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home4u/core/theming/app_styles.dart';
import 'package:home4u/core/utils/spacing.dart';
import 'package:home4u/features/cart/presentation/widgets/cart_details_widgets/cart_product_details_colors_list_view.dart';
import 'package:home4u/features/cart/presentation/widgets/cart_details_widgets/cart_product_details_favorite_button.dart';
import 'package:home4u/features/cart/presentation/widgets/cart_details_widgets/cart_product_details_screen_carousel_slider.dart'
    show CartProductDetailsScreenCarouselSlider;
import 'package:home4u/features/cart/presentation/widgets/cart_details_widgets/expandable_text.dart';
import 'package:home4u/features/cart/presentation/widgets/cart_details_widgets/plus_and_minus_controll_buttons.dart';
import 'package:home4u/locale/app_locale.dart';

import '../../../core/theming/app_assets.dart';
import '../../../core/theming/app_colors.dart';
import '../../../core/widgets/app_custom_button.dart';

class CartProductDetailsScreen extends StatelessWidget {
  const CartProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final images = [
      "assets/images/Main_Product_ Image.png",
      "assets/images/Main_Product_ Image.png",
      "assets/images/Main_Product_ Image.png",
      "assets/images/Main_Product_ Image.png",
      "assets/images/Main_Product_ Image.png",
      "assets/images/Main_Product_ Image.png",
      "assets/images/Main_Product_ Image.png",
    ];
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CartProductDetailsScreenCarouselSlider(images: images),
              verticalSpace(32),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Product Name",
                          style: AppStyles.font24BlackMedium,
                        ),
                        PlusAndMinusControllerButtons(),
                      ],
                    ),
                    verticalSpace(8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$100.00",
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
                      text: " doloredent, sunt in culpa qui offiborum.",
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
                          "Stock: 10",
                          style: AppStyles.font16BlackLight,
                        ),
                      ],
                    ),
                    verticalSpace(16),
                    Text(
                      "${AppLocale.dimensions.getString(context)} : 280*280*280 cm",
                      style: AppStyles.font16BlackLight,
                    ),
                    verticalSpace(16),
                    CartProductDetailsColorsListView(),
                    verticalSpace(64),
                    Row(
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
                    verticalSpace(32),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
