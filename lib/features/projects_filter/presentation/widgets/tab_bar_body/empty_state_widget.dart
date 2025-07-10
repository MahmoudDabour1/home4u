import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/theming/app_assets.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/utils/spacing.dart';

class EmptyStateWidget extends StatelessWidget {
  final String? title;
  const EmptyStateWidget({
    super.key,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AppAssets.ordersEmptyStateSvg,
            width: 160.w,
            height: 160.h,
          ),
          verticalSpace(16),
          Text(
            title ?? 'No requests founded',
            style: AppStyles.font20BlackMedium,
          ),
        ],
      ),
    );
  }
}
