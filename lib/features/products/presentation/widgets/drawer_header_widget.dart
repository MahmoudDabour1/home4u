import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theming/app_assets.dart';
import '../../../../core/utils/spacing.dart';

class DrawerHeaderWidget extends StatelessWidget {
  const DrawerHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.w),
      child: Align(
        alignment: Alignment.topLeft,
        child: SvgPicture.asset(
          AppAssets.appLogoSvg,
          height: 100.h,
          width: 100.w,
        ),
      ),
    );
  }
}
