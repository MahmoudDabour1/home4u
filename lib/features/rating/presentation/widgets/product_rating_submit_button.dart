import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/widgets/app_custom_button.dart';
import 'package:home4u/features/rating/logic/product_rating/product_rating_cubit.dart';
import 'package:home4u/features/rating/logic/product_rating/product_rating_state.dart';
import 'package:home4u/locale/app_locale.dart';

class ProductRatingSubmitButton extends StatelessWidget {
  final int productId;

  const ProductRatingSubmitButton({
    super.key,
    required this.productId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductRatingCubit, ProductRatingState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0).w,
          child: AppCustomButton(
            isLoading: state is InsertProductRatingLoading,
            textButton: AppLocale.submit.getString(context),
            btnWidth: MediaQuery.sizeOf(context).width,
            btnHeight: 50.h,
            onPressed: () {
              context.read<ProductRatingCubit>().validateAndSubmit(productId);
            },
          ),
        );
      },
    );
  }
}
