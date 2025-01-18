import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ListTileWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final String image;
  final String? trailingImage;

  const ListTileWidget({
    super.key,
    required this.title,
    required this.image,
    required this.onTap,  this.trailingImage,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(title),
      leading: SvgPicture.asset(image),
      trailing: SvgPicture.asset(trailingImage ?? ''),
      horizontalTitleGap: 6.w,
      minTileHeight: 10.h,
      minVerticalPadding: 10.h,
      visualDensity: VisualDensity.compact,
      contentPadding: EdgeInsets.symmetric(horizontal: 24.w),
    );
  }
}
