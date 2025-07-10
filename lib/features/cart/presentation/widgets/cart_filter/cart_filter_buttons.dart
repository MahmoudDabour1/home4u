import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home4u/features/cart/logic/cart_cubit.dart';
import '../../../../../core/routing/router_observer.dart';
import '../../../../../core/utils/spacing.dart';
import '../../../../../core/widgets/app_custom_button.dart';
import '../../../../../locale/app_locale.dart';
import 'package:home4u/core/extensions/navigation_extension.dart';


class CartFilterButtons extends StatelessWidget {
  const CartFilterButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(32),
        AppCustomButton(
            textButton: AppLocale.confirm.getString(context),
            btnWidth: MediaQuery.sizeOf(context).width,
            btnHeight: 50.h,
            onPressed: () {
              final cubit = context.read<CartCubit>();
              logger.i('Calling getCartProducts...');
              cubit.resetPagination();
              cubit.getCartProducts();
              context.pop();
            }),
        verticalSpace(16),
        AppCustomButton(
          textButton: AppLocale.cancel.getString(context),
          btnWidth: MediaQuery.sizeOf(context).width,
          btnHeight: 50.h,
          isBorder: true,
          onPressed: () {
            context.pop();
          },
        ),
      ],
    );
  }
}
