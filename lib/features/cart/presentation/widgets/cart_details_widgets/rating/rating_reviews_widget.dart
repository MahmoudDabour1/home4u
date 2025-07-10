import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/utils/spacing.dart';
import 'package:home4u/features/cart/data/models/rating_reviews_response_model.dart';
import 'package:home4u/features/cart/logic/cart_cubit.dart';
import 'package:home4u/features/cart/presentation/widgets/cart_details_widgets/rating/rating_reviews_single_item.dart';
import 'package:home4u/locale/app_locale.dart';

import '../../../../../../core/theming/app_colors.dart';
import '../../../../../../core/theming/app_styles.dart';
import '../../../../logic/cart_state.dart';

class RatingReviewsWidget extends StatefulWidget {
  final int productId;

  const RatingReviewsWidget({super.key, required this.productId});

  @override
  State<RatingReviewsWidget> createState() => _RatingReviewsWidgetState();
}

class _RatingReviewsWidgetState extends State<RatingReviewsWidget> {
  @override
  void initState() {
    super.initState();
    context.read<CartCubit>().getRateReviews(productId: widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      buildWhen: (previous, current) {
        return current is RateReviewsLoading ||
            current is RateReviewsSuccess ||
            current is RateReviewsFailure;
      },
      builder: (context, state) {
        return state.maybeWhen(
          rateReviewsLoading: () => setupLoading(),
          rateReviewsSuccess: (data) => setupSuccess(data),
          rateReviewsFailure: (error) => setupError(error),
          orElse: () => SizedBox.shrink(),
        );
      },
    );
  }

  Widget setupLoading() {
    return Center(
      child: CircularProgressIndicator(
        color: AppColors.primaryColor,
      ),
    );
  }

  Widget setupSuccess(RatingReviewResponseModel data) {
    return Container(
      color: AppColors.whiteColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(8.0.r),
            child: Text(
              '${data.data?.content?.length ?? 0} ${AppLocale.reviews.getString(context)}',
              style: AppStyles.font16BlackBold,
            ),
          ),
          Divider(
            color: AppColors.grayColor,
          ),
          data.data?.content == [] || data.data!.content!.isEmpty
              ? Column(
                  children: [
                    Image.asset("assets/images/empty_state.jpg",
                        height: 200.h, width: 200.w),
                    Text(
                      AppLocale.thisProductDoesHaveAnyReviewsYet
                          .getString(context),
                      textAlign: TextAlign.center,
                      style: AppStyles.font18BlackMedium,
                    ),
                    verticalSpace(16),
                  ],
                )
              : SizedBox.shrink(),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: data.data?.content?.length ?? 0,
            itemBuilder: (context, index) {
              return RatingReviewsSingleItem(
                data: data,
                index: index,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget setupError(String error) {
    return Center(
      child: Text(
        error,
        style: AppStyles.font16BlackLight,
      ),
    );
  }
}
