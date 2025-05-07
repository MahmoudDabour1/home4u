import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home4u/features/cart/logic/cart_cubit.dart';

import '../../../../../core/theming/app_assets.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/utils/spacing.dart';
import '../../../../../core/widgets/app_custom_button.dart';
import '../../../../../locale/app_locale.dart';
import 'package:home4u/core/extensions/navigation_extension.dart';

class CartFilterHeaderWidget extends StatefulWidget {
  const CartFilterHeaderWidget({super.key});

  @override
  State<CartFilterHeaderWidget> createState() => _CartFilterHeaderWidgetState();
}

class _CartFilterHeaderWidgetState extends State<CartFilterHeaderWidget> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CartCubit>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SvgPicture.asset(
              AppAssets.filterSvg,
              alignment: Alignment.center,
              width: 24.w,
              height: 24.h,
            ),
            horizontalSpace(6),
            Text(
              AppLocale.filter.getString(context),
              style: AppStyles.font24BlackMedium,
            ),
          ],
        ),

        Row(
          spacing: 8,
          children: [
            AppCustomButton(textButton: AppLocale.clear.getString(context),
                btnWidth: 80.w,
                btnHeight: 30.h,
                onPressed: (){
                  cubit.resetFilter();
                  cubit.getCartProducts(isRefresh: true);
                  Navigator.pop(context);

                }),
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: Icon(
                  Icons.close,
                  size: 24.r,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
