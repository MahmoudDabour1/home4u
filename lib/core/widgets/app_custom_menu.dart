import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../locale/app_locale.dart';
import 'app_custom_menu_item.dart';
import '../theming/app_assets.dart';
import '../theming/app_colors.dart';
import '../utils/spacing.dart';

class AppCustomMenu extends StatefulWidget {
  final VoidCallback onDeleteButtonPressed;
  final VoidCallback onEditButtonPressed;

  const AppCustomMenu({super.key, required this.onDeleteButtonPressed, required this.onEditButtonPressed});

  @override
  State<AppCustomMenu> createState() => _AppCustomMenuState();
}

class _AppCustomMenuState extends State<AppCustomMenu> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        width: 104.w,
        padding: EdgeInsets.all(12.r),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppCustomMenuItem(
              text: AppLocale.delete.getString(context),
              onTap: widget.onDeleteButtonPressed,
              icon: AppAssets.deleteSvgImage,
            ),
            verticalSpace(8),
            AppCustomMenuItem(
              text: AppLocale.edit.getString(context),
              onTap: widget.onEditButtonPressed,
              icon: AppAssets.editSvgImage,
            ),
          ],
        ),
      ),
    );
  }
}
