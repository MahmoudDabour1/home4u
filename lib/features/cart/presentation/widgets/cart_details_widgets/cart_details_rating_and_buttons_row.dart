import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/utils/spacing.dart';
import 'package:home4u/features/cart/logic/cart_cubit.dart';
import 'package:home4u/features/cart/logic/cart_cubit.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/widgets/app_custom_love_container.dart';
import '../../../../../core/widgets/app_custom_rating_container.dart';
import '../../../data/models/rating_chart_response_model.dart';
import '../../../logic/cart_state.dart';

class CartDetailsRatingAndButtonsRow extends StatelessWidget {
  const CartDetailsRatingAndButtonsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            final cartCubit = context.read<CartCubit>();
            final ratingChart = cartCubit.ratingChartResponseModel;

            if (ratingChart == null || ratingChart.data == null) {
              return SizedBox.shrink();
            }

            return AppCustomRatingContainer(
              rating: ratingChart.data!.overAllRating?.toDouble() ?? 0.0,
              reviewCount: ratingChart.data!.countRantings?.toDouble() ?? 0,
              isDetailsScreen: true,

            );
          },
        ),
        Row(
          children: [
            AppCustomLoveContainer(onPressed: () {}),
            horizontalSpace(8),
            Container(
              width: 35.w,
              height: 35.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: AppColors.whiteColor,
              ),
              child: Center(
                child: IconButton(
                  icon: Icon(
                    Icons.share,
                    // color: isFavorite ? Colors.red : AppColors.grayColor,
                    size: 20.h,
                  ),
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
