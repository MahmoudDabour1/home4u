import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home4u/core/theming/app_assets.dart';
import 'package:home4u/core/theming/app_styles.dart';
import 'package:home4u/core/utils/spacing.dart';
import 'package:home4u/core/widgets/app_back_button.dart';
import 'package:home4u/core/widgets/app_text_form_field.dart';
import 'package:home4u/features/cart/logic/cart_cubit.dart';
import 'package:home4u/features/cart/logic/cart_state.dart';
import 'package:home4u/features/cart/presentation/widgets/order_details_widgets/order_details_item.dart';
import 'package:home4u/locale/app_locale.dart';

import '../../../core/theming/app_colors.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 32.h, left: 24.w, right: 24.w),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AppBackButton(),
                    const Spacer(),
                    Text(
                      AppLocale.myCart.getString(context),
                      style: AppStyles.font20BlackMedium,
                    ),
                    const Spacer(),
                  ],
                ),
                verticalSpace(32),
                BlocBuilder<CartCubit, CartState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      cartLoading: () =>
                          const Center(child: CircularProgressIndicator()),
                      cartFailure: (error) => Center(child: Text(error)),
                      cartSuccess: (items) {
                        final total = items.fold<double>(
                            0.0,
                            (sum, item) =>
                                sum +
                                (item.product.price ?? 0) *
                                    (item.quantity ?? 0));
                        if (items.isEmpty) {
                          return _buildEmptyCartUI(context, total);
                        }
                        return _buildCartUI(
                            context, items.length, total, items);
                      },
                      orElse: () => _buildEmptyCartUI(context, 0.0),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyCartUI(BuildContext context, double total) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.65,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Icon(Icons.shopping_cart_outlined,
              size: 100.w, color: Colors.grey),
          verticalSpace(16.h),
          Text(
            "Cart Empty",
            style: AppStyles.font20BlackMedium,
          ),
          verticalSpace(32.h),
        ],
      ),
    );
  }

  Widget _buildCartUI(
      BuildContext context, int itemCount, double total, List cartItems) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.65,
          child: ListView.separated(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: const AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) => OrderDetailsItem(
              cartItem: cartItems[index],
              onQuantityChanged: (p0) => context
                  .read<CartCubit>()
                  .updateQuantity(cartItems[index], p0),
              onRemove: () => context
                  .read<CartCubit>()
                  .removeFromCart(cartItems[index].product),
            ),
            separatorBuilder: (context, index) => SizedBox(height: 16.h),
            itemCount: itemCount,
          ),
        ),
        _buildCheckoutSection(context, total),
      ],
    );
  }

  Widget _buildCheckoutSection(BuildContext context, double total) {
    return Column(
      children: [
        verticalSpace(32.h),
        Row(
          children: [
            Expanded(
              flex: 5,
              child: AppTextFormField(
                labelText: "Enter your promo code",
                validator: (p0) {},
              ),
            ),
            horizontalSpace(16.w),
            Expanded(
              child: Container(
                height: 60.h,
                width: 60.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16).r,
                  gradient: LinearGradient(
                    colors: [
                      AppColors.secondaryGradientColor,
                      AppColors.secondaryColor,
                    ],
                  ),
                ),
                child: IconButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    fixedSize: WidgetStateProperty.all<Size>(Size(50.w, 50.h)),
                    backgroundColor:
                        WidgetStateProperty.all(Colors.transparent),
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16).r),
                    ),
                  ),
                  icon: SvgPicture.asset(
                    AppAssets.arrowRightBlackSvg,
                    width: 28.w,
                    height: 28.h,
                    colorFilter: const ColorFilter.mode(
                        AppColors.whiteColor, BlendMode.srcIn),
                  ),
                ),
              ),
            ),
          ],
        ),
        verticalSpace(16.h),
        Row(
          children: [
            Expanded(
              child: Text(
                AppLocale.total.getString(context),
                style: AppStyles.font16BlackLight,
              ),
            ),
            Text(
              "\$ ${total.toStringAsFixed(2)}",
              style: AppStyles.font20BlackMedium,
            ),
          ],
        ),
        verticalSpace(32.h),
      ],
    );
  }
}
