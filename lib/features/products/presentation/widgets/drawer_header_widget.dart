import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theming/app_assets.dart';
import '../../../../core/utils/spacing.dart';

class DrawerHeaderWidget extends StatelessWidget {
  const DrawerHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          AppAssets.appLogoSvg,
          height: 46.h,
          width: 95.w,
        ),
        horizontalSpace(18.w),
        SvgPicture.asset(
          AppAssets.arrowRightBlackSvg,
          height: 20.h,
          width: 25.w,
        ),
      ],
    );
  }
}
