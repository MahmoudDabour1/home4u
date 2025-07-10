import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home4u/core/theming/app_styles.dart';

import '../../../../core/theming/app_assets.dart';
import '../../../../core/utils/spacing.dart';
import '../../../../locale/app_locale.dart';

class OrderEmptyStateWidget extends StatelessWidget {
  const OrderEmptyStateWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          verticalSpace(
            MediaQuery.sizeOf(context).height * 0.2,
          ),
          SvgPicture.asset(
            AppAssets.ordersEmptyStateSvg,
            width: 160.w,
            height: 160.h,
          ),
          verticalSpace(16),
          Text(
            AppLocale.noCurrentOrders.getString(context),
            style: AppStyles.font20BlackMedium,
          ),
        ],
      ),
    );
  }
}
