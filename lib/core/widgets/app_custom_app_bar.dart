import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/app_colors.dart';
import 'app_back_button.dart';

class AppCustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool? isCenterTitle;

  const AppCustomAppBar(
      {super.key, required this.title, this.isCenterTitle = true});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: isCenterTitle,
      backgroundColor: AppColors.whiteColor,
      elevation: 0,
      leading: Padding(
        padding: EdgeInsetsDirectional.only(start: 16.w),
        child: AppBackButton(),
      ),
      title: Text(title),
    );
  }
}
