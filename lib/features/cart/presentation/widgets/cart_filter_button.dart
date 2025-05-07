import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/cart/logic/cart_cubit.dart';
import 'package:home4u/features/cart/presentation/widgets/cart_filter/cart_filter_drop_down_buttons.dart';
import 'package:home4u/features/cart/presentation/widgets/cart_filter/cart_price_section.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/utils/spacing.dart';
import '../../../../core/widgets/app_custom_filter_button.dart';
import '../../../products/presentation/widgets/filter/filter_header_widget.dart';
import 'cart_filter/cart_drop_down_menu_buttons.dart';
import 'cart_filter/cart_filter_buttons.dart';
import 'cart_filter/cart_filter_header_widget.dart';

class CartFilterButton extends StatelessWidget {
  const CartFilterButton({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CartCubit>();
    return AppCustomFilterButton(
      onPressed: () {
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (BuildContext context) {
            return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.6,
                  child: SingleChildScrollView(
                    child: Container(
                      padding: const EdgeInsets.all(16.0), // Use const here
                      decoration: BoxDecoration(
                        color: AppColors.scaffoldBusinessBackgroundColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.r),
                          topRight: Radius.circular(20.r),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            verticalSpace(8),
                            CartFilterHeaderWidget(),// Use const here
                            CartFilterDropDownButtons(),
                            CartDropDownMenuButtons(),
                            verticalSpace(8),
                            CartPriceSection(),
                            CartFilterButtons(),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
