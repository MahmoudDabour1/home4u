import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/cart/data/models/rating_chart_response_model.dart';
import 'package:home4u/features/cart/presentation/widgets/cart_details_widgets/rating/rating_bar_single_item.dart';
import 'package:home4u/locale/app_locale.dart';

import '../../../../../../core/theming/app_colors.dart';
import '../../../../../../core/theming/app_styles.dart';
import '../../../../../../core/utils/spacing.dart';
import '../../../../logic/cart_cubit.dart';
import '../../../../logic/cart_state.dart';

class RatingChartSection extends StatefulWidget {
  final int productId;

  const RatingChartSection({super.key, required this.productId});

  @override
  State<RatingChartSection> createState() => _RatingChartSectionState();
}

class _RatingChartSectionState extends State<RatingChartSection> {
  @override
  void initState() {
    super.initState();
    context.read<CartCubit>().getProductRateChart(widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      buildWhen: (previous, current) {
        return current is RateChartLoading ||
            current is RateChartSuccess ||
            current is RateChartFailure;
      },
      builder: (context, state) {
        return state.maybeWhen(
          rateChartLoading: () => Center(
            child: CircularProgressIndicator(
              color: AppColors.primaryColor,
            ),
          ),
          rateChartSuccess: (data) => setupSuccess(data),
          rateChartFailure: (error) => Center(
            child: Text(
              error,
              style: AppStyles.font16BlackLight,
            ),
          ),
          orElse: () => SizedBox.shrink(),
        );
      },
    );
  }

  Widget setupSuccess(RatingChartResponseModel data) {
    return Container(
      padding: EdgeInsets.all(16.0.r),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocale.productRatingsReviews.getString(context),
            style: AppStyles.font20BlackMedium,
          ),
          verticalSpace(16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.data?.overAllRating.toString() ?? 0.0.toString(),
                      style: AppStyles.font24BlackBold,
                    ),
                    verticalSpace(8),
                    RatingBar.readOnly(
                      filledColor: Colors.green,
                      size: 22.w,
                      isHalfAllowed: true,
                      initialRating: double.parse(
                          data.data?.overAllRating.toString() ?? '0.0'),
                      maxRating: 5,
                      halfFilledIcon: Icons.star_half,
                      filledIcon: Icons.star,
                      emptyIcon: Icons.star_border,
                      halfFilledColor: Colors.green,
                      emptyColor: Colors.green,
                    ),
                    verticalSpace(8),
                    Text(
                      '${AppLocale.basedOn.getString(context)} ${data.data?.countRantings} ${AppLocale.ratings.getString(context)}',
                      style: AppStyles.font16GrayMedium,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    RatingBarSingleItem(
                        star: data.data?.fiveStarPct?.toDouble() ?? 0.0,
                        percentage: data.data?.fiveStarPct?.toDouble() ?? 0.0,
                        barColor: Colors.green),
                    RatingBarSingleItem(
                        star: data.data?.twoStarPct?.toDouble() ?? 0.0,
                        percentage: data.data?.twoStarPct?.toDouble() ?? 0.0,
                        barColor: Colors.lightGreen),
                    RatingBarSingleItem(
                        star: data.data?.threeStarPct?.toDouble() ?? 0.0,
                        percentage: data.data?.threeStarPct?.toDouble() ?? 0.0,
                        barColor: Colors.orangeAccent),
                    RatingBarSingleItem(
                        star: data.data?.fourStarPct?.toDouble() ?? 0.0,
                        percentage: data.data?.fourStarPct?.toDouble() ?? 0.0,
                        barColor: Colors.orange),
                    RatingBarSingleItem(
                        star: data.data?.fiveStarPct?.toDouble() ?? 0.0,
                        percentage: data.data?.fiveStarPct?.toDouble() ?? 0.0,
                        barColor: Colors.red),
                  ],
                ),
              ),
            ],
          ),
          verticalSpace(16),
          data.data?.overAllRating == 0
              ? Text(
                  AppLocale.thisProductDoesHaveAnyRatingYet.getString(context),
                  textAlign: TextAlign.center,
                  style: AppStyles.font18BlackMedium,
                )
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}
