import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/theming/app_colors.dart';
import 'package:home4u/core/theming/app_styles.dart';
import 'package:home4u/features/rating/logic/product_rating/product_rating_cubit.dart';
import '../../../../core/utils/spacing.dart';

class ProductRatingInfoSection extends StatelessWidget {
  const ProductRatingInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProductRatingCubit>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0).w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "How do you rate this product?",
            style: AppStyles.font20WhiteBold.copyWith(
              color: AppColors.blackColor,
            ),
          ),
          verticalSpace(8),
          RatingBar(
            size: 45.w,
            isHalfAllowed: true,
            initialRating: 0,
            maxRating: 5,
            halfFilledIcon: Icons.star_half,
            filledIcon: Icons.star,
            emptyIcon: Icons.star_border,
            onRatingChanged: (rating) => cubit.updateRating(rating),
          ),
          verticalSpace(16),
          Text(
            "Product Review",
            style: AppStyles.font20WhiteBold.copyWith(
              color: AppColors.blackColor,
            ),
          ),
          verticalSpace(8),
          TextFormField(
            controller: cubit.commentController,
            keyboardType: TextInputType.multiline,
            textInputAction: TextInputAction.newline,
            maxLines: 10,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return "Please write a review.";
              }
              return null;
            },
            decoration: InputDecoration(
              hintText:
              "What did you like or dislike about the product? How did you use this product?",
              alignLabelWithHint: true,
              isDense: true,
              contentPadding: EdgeInsets.symmetric(
                vertical: 16.h,
                horizontal: 20.w,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.r),
                borderSide: BorderSide(
                  color: AppColors.secondaryColor,
                  width: 1.3,
                ),
              ),
            ),
          ),
          verticalSpace(32),
        ],
      ),
    );
  }
}
