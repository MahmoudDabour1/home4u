import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/cart/data/models/rating_reviews_response_model.dart';
import 'package:home4u/features/cart/logic/cart_cubit.dart';
import 'package:home4u/features/cart/presentation/widgets/cart_details_widgets/rating/rating_reviews_single_item.dart';

import '../../../../../../core/theming/app_colors.dart';
import '../../../../../../core/theming/app_styles.dart';
import '../../../../logic/cart_state.dart';

class RatingReviewsWidget extends StatelessWidget {
  const RatingReviewsWidget({super.key});

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
      child: ListView.builder(
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
