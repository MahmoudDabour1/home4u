import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/extensions/navigation_extension.dart';
import 'package:home4u/core/routing/routes.dart';

import '../../../../core/theming/app_assets.dart';
import '../../../../core/widgets/app_custom_drop_down_search_menu.dart';

class ProfileCustomMenuAndDialog extends StatelessWidget {
  final Widget deleteWidget;
  final bool isCertifications;

   const ProfileCustomMenuAndDialog(
      {super.key, required this.deleteWidget, this.isCertifications = false});

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
              builder: (context) => deleteWidget,
            );
          }
          if (value == "edit") {

            isCertifications
                ? context.pushNamed(Routes.addCertificationScreen)
                : context.pushNamed(Routes.addProjectScreen);
          }
        },
      ),
    );
  }
}
