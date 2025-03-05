import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/utils/spacing.dart';
import 'package:home4u/features/exhibition/presentation/widgets/rating_preview/review_rating_container.dart';
import 'package:home4u/features/exhibition/presentation/widgets/rating_preview/user_rating_of_product_item.dart';

import '../../../core/theming/app_assets.dart';
import '../../../core/theming/app_colors.dart';
import '../../../core/widgets/business_header_widget.dart';
import '../../../locale/app_locale.dart';

class BusinessReviewScreen extends StatelessWidget {
  const BusinessReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBusinessBackgroundColor,
      body: Column(
        children: [
          BusinessHeaderWidget(
            headerTitle: AppLocale.review.getString(context),
            headerIcon: AppAssets.reviewIcon,
            menuOnPressed: () {},
          ),
          verticalSpace(32),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: ReviewRatingContainer(),
                  ),
                  SliverToBoxAdapter(child: verticalSpace(32)),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      childCount: 5,
                      (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 32.0).h,
                          child: UserRatingOfProductItem(),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
