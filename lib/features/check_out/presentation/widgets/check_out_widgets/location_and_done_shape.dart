import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home4u/core/utils/spacing.dart';

import '../../../../../core/theming/app_assets.dart';
import 'dotted_line_painter.dart';

class LocationAndDoneShape extends StatelessWidget {
  final String? changeDoneImage;

  const LocationAndDoneShape({super.key, this.changeDoneImage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      child: Row(
        children: [
          SvgPicture.asset(
            AppAssets.doneBlackSvg,
            fit: BoxFit.contain,
            width: 22.w,
            height: 22.h,
          ),
          horizontalSpace(20),
          Expanded(
            child: CustomPaint(
              painter: DottedLinePainter(),
              child: verticalSpace(70),
            ),
          ),
          horizontalSpace(66),
          Expanded(
            child: CustomPaint(
              painter: DottedLinePainter(),
              child: verticalSpace(70),
            ),
          ),
          horizontalSpace(20),
          SvgPicture.asset(
            AppAssets.locationBlackSvg,
            fit: BoxFit.contain,
            width: 22.w,
            height: 22.h,
          ),
        ],
      ),
    );
  }
}
