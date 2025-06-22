import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:home4u/core/extensions/navigation_extension.dart';
import 'package:home4u/core/theming/app_styles.dart';
import 'package:home4u/features/user/home/presentation/widgets/services_widget/services_grid_view.dart';
import 'package:home4u/features/user/home/presentation/widgets/services_widget/services_grid_view_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/routing/routes.dart';
import '../../../../../../core/theming/app_assets.dart';
import '../../../../../../core/utils/spacing.dart';
import '../../../../../../locale/app_locale.dart';
import '../custom_see_all_row_widget.dart';

class ServicesWidget extends StatelessWidget {
  const ServicesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomSeeAllRowWidget(
            text: AppLocale.services.getString(context),
            onPressed: () {},
          ),
          // Text(
          //     AppLocale.services.getString(context),
          //   style : AppStyles.font20BlackMedium,
          // ),
          verticalSpace(32),
          ServicesGridView(),
          verticalSpace(16),
          ServicesGridViewItem(
            title: AppLocale.shopNowTitle.getString(context),
            subTitle: AppLocale.shopSubtitle.getString(context),
            imageUrl: AppAssets.shopSvg,
            onPressed: () => context.pushNamed(Routes.cartScreen),
          ),
        ],
      ),
    );
  }
}
