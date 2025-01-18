import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helpers/helper_methods.dart';
import '../../../../core/theming/app_assets.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../locale/app_locale.dart';

class SwitchListTileWidget extends StatefulWidget {
  const SwitchListTileWidget({super.key});

  @override
  State<SwitchListTileWidget> createState() => _SwitchListTileWidgetState();
}

class _SwitchListTileWidgetState extends State<SwitchListTileWidget> {
  bool isNotificationEnabled = true;
  bool isCustomize = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SwitchListTile(
          secondary: SvgPicture.asset(AppAssets.notificationImageSvg),
          activeColor: AppColors.whiteColor,
          activeTrackColor: AppColors.secondaryColor,
          title:
          Text(AppLocale.enableNotifications.getString(context)),
          value: isNotificationEnabled,
          onChanged: (value) {
            setState(() {
              isNotificationEnabled = !isNotificationEnabled;
            });
            showToast(
                message: AppLocale.notifications.getString(context));
          },
          visualDensity: VisualDensity.compact,
          contentPadding: EdgeInsets.symmetric(horizontal: 24.w),
        ),
        SwitchListTile(
          secondary: SvgPicture.asset(AppAssets.notificationImageSvg),
          activeColor: AppColors.whiteColor,
          activeTrackColor: AppColors.secondaryColor,
          title:
          Text(AppLocale.customizeAlertTypes.getString(context)),
          value: isCustomize,
          onChanged: (value) {
            setState(() {
              isCustomize = !isCustomize;
              showToast(
                  message: AppLocale.customizeAlertTypes
                      .getString(context));
            });
          },
          visualDensity: VisualDensity.compact,
          contentPadding: EdgeInsets.symmetric(horizontal: 24.w),
        ),
      ],
    );
  }
}
