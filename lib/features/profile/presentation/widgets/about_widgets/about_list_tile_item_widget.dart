import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home4u/core/theming/app_assets.dart';
import 'package:home4u/core/widgets/app_custom_icon_button.dart';

import '../../../../../core/theming/app_styles.dart';

class AboutListTileItemWidget extends StatelessWidget {
  final String title;
  final String imagePath;
  final TextStyle? titleStyle;
  final VoidCallback? onPressed;
  final VoidCallback onEdit;

  const AboutListTileItemWidget({
    super.key,
    required this.title,
    required this.imagePath,
    this.titleStyle,
    this.onPressed,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
        enabled: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 0),
        leading: SvgPicture.asset(
          imagePath,
          width: 16.w,
          height: 16.h,
        ),
        title: GestureDetector(
          onTap: onPressed,
          child: Text(
            title,
            style: titleStyle ?? AppStyles.font16BlackLight,
          ),
        ),
        trailing: AppCustomIconButton(
          image: AppAssets.editSvgImage,
          onPressed: onEdit,
          width: 16.w,
          height: 16.h,
        )
    );
  }
}
