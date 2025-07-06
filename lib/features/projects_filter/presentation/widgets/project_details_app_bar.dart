import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_styles.dart';
import '../../../../core/widgets/app_back_button.dart';
import '../../../../locale/app_locale.dart';

class ProjectDetailsAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const ProjectDetailsAppBar({
    super.key,
  });

  @override
  Size get preferredSize => Size.fromHeight(56.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      title: Text(
        AppLocale.projectDetails.getString(context),
        style: AppStyles.font18BlackMedium,
      ),
      leading: Padding(
        padding: EdgeInsetsDirectional.only(
          start: 8.w,
          top: 4.h,
          bottom: 4.h,
          end: 8.w,
        ),
        child: AppBackButton(),
      ),
    );
  }
}
