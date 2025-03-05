import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class BusinessTextFieldPrefixIcon extends StatelessWidget {
  final String svgIcon;

  const BusinessTextFieldPrefixIcon({super.key, required this.svgIcon});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 4.w,
        children: [
          SvgPicture.asset(
            svgIcon,
            width: 20.w,
            height: 20.h,
          ),
          VerticalDivider(
            color: Colors.black,
            thickness: 1,
            width: 8.w,
            indent: 8.0.w,
            endIndent: 8.0.w,
          ),
        ],
      ),
    );
  }
}
