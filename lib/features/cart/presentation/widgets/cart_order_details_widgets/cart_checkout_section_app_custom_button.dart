import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/widgets/app_custom_button.dart';
import 'package:home4u/features/cart/logic/cart_cubit.dart';
import 'package:home4u/locale/app_locale.dart';

class CartCheckoutSectionAppCustomButton extends StatelessWidget {
  const CartCheckoutSectionAppCustomButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppCustomButton(
      textButton: AppLocale.proceedToCheckOut.getString(context),
      btnWidth: MediaQuery.sizeOf(context).width,
      btnHeight: 50.h,
      onPressed: () => context.read<CartCubit>().insertOrderDetails(),
    );
  }
}
