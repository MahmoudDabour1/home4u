import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/app_assets.dart';
import '../../../../../core/widgets/app_custom_drop_down_search_menu.dart';
import '../../../../../locale/app_locale.dart';

class CertificationCustomMenuAndDialog extends StatelessWidget {
  final Widget deleteWidget;
  final VoidCallback? onEdit;
  final String? icon;


  const CertificationCustomMenuAndDialog({
    super.key,
    required this.deleteWidget,
    this.onEdit, this.icon = AppAssets.menuSvgImage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(top: 10.h, start: 10.w),
      child: AppCustomDropDownSearchMenu(
        icon:icon?? AppAssets.menuSvgImage,
        onItemSelected: (value) {
          if (value == AppLocale.delete.getString(context)) {
            showDialog(
              context: context,
              builder: (context) => deleteWidget,
            );
          }
          if (value == AppLocale.edit.getString(context)) {
            onEdit?.call();
          }
        },
      ),
    );
  }
}
