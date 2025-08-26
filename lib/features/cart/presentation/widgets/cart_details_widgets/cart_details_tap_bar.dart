import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/cart/presentation/widgets/cart_details_widgets/specifications_section.dart';
import 'package:home4u/locale/app_locale.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../products/data/models/product_preview_response.dart';
import 'overview_section.dart';

class CartDetailsTapBar extends StatelessWidget {
  final ProductPreviewResponse product;

  const CartDetailsTapBar({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(color: AppColors.whiteColor),
          child: TabBar(
              dividerColor: AppColors.grayColor,
              indicatorWeight: 3,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorColor: AppColors.primaryColor,
              labelStyle: AppStyles.font20BlackMedium,
              unselectedLabelColor: AppColors.grayColor,
              labelPadding: EdgeInsets.symmetric(vertical: 8.h),
              tabs: [
                Tab(
                  text: AppLocale.overview.getString(context),
                ),
                Tab(
                  text: AppLocale.specialOffers.getString(context),
                ),
              ]),
        ),
        Container(
          height: MediaQuery.sizeOf(context).height*0.25.h,
          decoration: BoxDecoration(color: AppColors.whiteColor),
          child:TabBarView(
            children: [
              OverviewSection(product: product),
              SpecificationsSection(
                product: product,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
