import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/spacing.dart';

class AboutWebCustomItemWidget extends StatelessWidget {
  final String iconPath;
  final VoidCallback onTap;
  const AboutWebCustomItemWidget({super.key, required this.iconPath, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        GestureDetector(
          onTap: onTap,
          child: SvgPicture.asset(
            iconPath,
            width: 32.w,
            height: 32.h,
          ),
        ),
        horizontalSpace(16),

      ],
    );
  }
}
