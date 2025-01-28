import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/helper_methods.dart';
import '../../../../core/theming/app_assets.dart';
import '../../../../core/widgets/app_custom_drop_down_search_menu.dart';

class ProfileCustomMenuAndDialog extends StatelessWidget {
  final Widget widget;

  const ProfileCustomMenuAndDialog({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h, left: 10.w),
      child: AppCustomDropDownSearchMenu(
        icon: AppAssets.menuSvgImage,
        onItemSelected: (value) {
          if (value == "delete") {
            showDialog(
              context: context,
              builder: (context) => widget,
            );
          }
          if (value == "edit") {
            showToast(message: "edit");
          }
        },
      ),
    );
  }
}
