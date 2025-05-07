import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/extensions/navigation_extension.dart';
import 'package:home4u/core/theming/app_colors.dart';

import '../../../../core/routing/routes.dart';
import '../../logic/cart_cubit.dart';
import '../../logic/cart_state.dart';

class CartBadgeButton extends StatelessWidget {
  const CartBadgeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return state.maybeWhen(
          cartLoading: () => _buildButton(count: 0, context: context),
          cartFailure: (error) => _buildButton(count: 0, context: context),
          cartSuccess: (items) =>
              _buildButton(count: items.length, context: context),
          orElse: () => SizedBox(),
        );
      },
    );
  }

  Widget _buildButton({required int count, required BuildContext context}) {
    return IconButton(
      onPressed: () => context.pushNamed(Routes.orderDetailsScreen),
      padding: EdgeInsets.zero,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(AppColors.whiteColor),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
        ),
        fixedSize: WidgetStateProperty.all(Size(53.w, 53.h)),
      ),
      icon: Badge.count(
        count: count,
        child: Icon(
          Icons.shopping_cart,
          color: AppColors.primaryColor,
          size: 28.w,
        ),
      ),
    );
  }
}
