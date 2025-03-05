import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../theming/app_styles.dart';

class AppCustomListTile extends StatelessWidget {
  final String title;
  final String? iconImage;
  final bool needLeading;
  final TextStyle? textStyle;

  const AppCustomListTile({
    super.key,
    required this.title,
     this.iconImage,
    this.needLeading = true,
    this.textStyle
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:needLeading==true? SvgPicture.asset(
        iconImage!,
        width: 16.w,
        height: 16.h,
      ):null,
      title: Text(title, style: textStyle??AppStyles.font16GrayLight),
      horizontalTitleGap: 4.w,
      contentPadding: EdgeInsets.symmetric(vertical: 8.w),
      minVerticalPadding: 0,
      minLeadingWidth: 0,
      minTileHeight: 0,
    );
  }
}
