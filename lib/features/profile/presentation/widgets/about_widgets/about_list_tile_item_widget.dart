import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home4u/features/profile/presentation/widgets/about_widgets/about_custom_menu_and_dialog.dart';

import '../../../../../core/theming/app_styles.dart';

class AboutListTileItemWidget extends StatelessWidget {
  final String title;
  final String imagePath;
  final TextStyle? titleStyle;
  final VoidCallback? onPressed;
  final VoidCallback? onEdit;

  const AboutListTileItemWidget({
    super.key,
    required this.title,
    required this.imagePath,
    this.titleStyle,
    this.onPressed,
    this.onEdit,
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
      trailing: AboutCustomMenuAndDialog(
        onEdit: onEdit,
      ),
    );
  }
}
