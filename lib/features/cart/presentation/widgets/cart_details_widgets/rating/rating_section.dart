import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/cart/data/models/rating_response_model.dart';
import 'package:home4u/features/cart/logic/cart_cubit.dart';
import 'package:home4u/locale/app_locale.dart';

import '../../../../../../core/theming/app_colors.dart';
import '../../../../../../core/theming/app_styles.dart';
import '../../../../../../core/theming/font_weight_helper.dart';
import '../../../../../../core/utils/spacing.dart';
import '../../../../logic/cart_state.dart';

class RatingSection extends StatefulWidget {
  const RatingSection({super.key});

  @override
  State<RatingSection> createState() => _RatingSectionState();
}

class _RatingSectionState extends State<RatingSection> {
  @override
  void initState() {
    super.initState();
    context.read<CartCubit>().getProductRate(10);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.whiteColor,
      child: Padding(
        padding: EdgeInsets.all(8.0.r),
        child: BlocBuilder<CartCubit, CartState>(
          buildWhen: (previous, current) {
            return current is ProductRateLoading ||
                current is ProductRateSuccess ||
                current is ProductRateFailure;
          },
          builder: (context, state) {
            return state.maybeWhen(
              productRateLoading: () => Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
              ),
              productRateSuccess: (data) => setupSuccess(data, context),
              productRateFailure: (error) => Center(
                child: Text(
                  error,
                  style: AppStyles.font16BlackLight,
                ),
              ),
              orElse: () {
                return const SizedBox.shrink();
              },
            );
          },
        ),
      ),
    );
  }

  Widget setupSuccess(RatingResponseModel data, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpace(8),
        Text(
          AppLocale.productRating.getString(context),
          style: AppStyles.font16BlackBold,
        ),
        verticalSpace(16),
        Row(
          children: [
            Text(
              data.data!.rate.toString(),
              style: AppStyles.font20BlackMedium.copyWith(
                fontWeight: FontWeightHelper.bold,
              ),
            ),
            horizontalSpace(8),
            RatingBar.readOnly(
              filledColor: Colors.green,
              size: 30.w,
              isHalfAllowed: true,
              initialRating: data.data!.rate ?? 0,
              maxRating: 5,
              halfFilledIcon: Icons.star_half,
              filledIcon: Icons.star,
              emptyIcon: Icons.star_border,
              halfFilledColor: Colors.green,
              emptyColor: Colors.green,
            ),
          ],
        ),
        Divider(),
        // RatingReviewsWidget()
      ],
    );
  }
}
