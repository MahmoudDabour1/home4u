import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/extensions/navigation_extension.dart';
import 'package:home4u/core/theming/app_colors.dart';

import '../../../../core/routing/routes.dart';
import '../../logic/cart_cubit.dart';
import '../../logic/cart_state.dart';

class CartBadgeButton extends StatefulWidget {
  const CartBadgeButton({super.key});

  @override
  State<CartBadgeButton> createState() => _CartBadgeButtonState();
}

class _CartBadgeButtonState extends State<CartBadgeButton> {
  int _lastKnownCount = 0;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {
        state.maybeWhen(
          cartSuccess: (items) => _lastKnownCount = items.length,
          orElse: () {},
        );
      },
      builder: (context, state) {
        return _buildButton(
          count: state.maybeWhen(
            cartSuccess: (items) => items.length,
            orElse: () => _lastKnownCount,
          ),
          context: context,
        );
      },
    );
  }

  Widget _buildButton({required int count, required BuildContext context}) {
    return IconButton(
      onPressed: () async{
        await context.read<CartCubit>().resetAllFilters();
        if (mounted) {
          context.pushNamed(Routes.orderDetailsScreen);
        }
      },
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
        isLabelVisible: count > 0,
        child: Icon(
          Icons.shopping_cart,
          color: AppColors.primaryColor,
          size: 28.w,
        ),
      ),
    );
  }
}