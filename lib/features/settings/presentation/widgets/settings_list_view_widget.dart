import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/extensions/navigation_extension.dart';
import 'package:home4u/core/helpers/shared_pref_helper.dart';
import 'package:home4u/core/helpers/shared_pref_keys.dart';
import 'package:home4u/core/routing/routes.dart';
import 'package:home4u/features/settings/presentation/widgets/switch_list_tile_widget.dart';

import '../../../../core/theming/app_assets.dart';
import '../../../../core/theming/app_styles.dart';
import '../../../../core/utils/spacing.dart';
import '../../../../locale/app_locale.dart';
import 'language_dropdown_sheet.dart';
import 'list_tile_widget.dart';

class SettingsListViewWidget extends StatelessWidget {
  const SettingsListViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Text(
            AppLocale.account.getString(context),
            style: AppStyles.font16BlackMedium,
          ),
        ),
        ListTileWidget(
          onTap: () {},
          image: AppAssets.editProfileImageSvg,
          title: AppLocale.editProfile.getString(context),
        ),
        ListTileWidget(
          onTap: () {},
          image: AppAssets.lockBlackImageSvg,
          title: AppLocale.changePassword.getString(context),
        ),
        ListTileWidget(
          onTap: () {
            SharedPrefHelper.removeData(SharedPrefKeys.userToken);
            context.pushNamed(Routes.loginScreen);
          },
          image: AppAssets.logOutImageSvg,
          title: AppLocale.logout.getString(context),
        ),
        verticalSpace(16),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Text(
            AppLocale.notifications.getString(context),
            style: AppStyles.font16BlackMedium,
          ),
        ),
        SwitchListTileWidget(),
        verticalSpace(16),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Text(
            AppLocale.privacy.getString(context),
            style: AppStyles.font16BlackMedium,
          ),
        ),
        ListTileWidget(
          onTap: () {},
          image: AppAssets.managePermissionsImageSvg,
          title: AppLocale.managePermissions.getString(context),
          trailingImage: AppAssets.arrowDownSvgImage,
        ),
        ListTileWidget(
          onTap: () {},
          image: AppAssets.settingSvgImage,
          title: AppLocale.privacySettings.getString(context),
          trailingImage: AppAssets.arrowDownSvgImage,
        ),
        verticalSpace(16),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Text(
            AppLocale.appearance.getString(context),
            style: AppStyles.font16BlackMedium,
          ),
        ),
        ListTileWidget(
          onTap: () {
            showLanguageDropdownSheet(context);
          },
          image: AppAssets.changeLanguageImageSvg,
          title: AppLocale.changeLanguage.getString(context),
          trailingImage: AppAssets.arrowDownSvgImage,
        ),
        verticalSpace(16),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Text(
            AppLocale.support.getString(context),
            style: AppStyles.font16BlackMedium,
          ),
        ),
        ListTileWidget(
          onTap: () {},
          image: AppAssets.faqsImageSvg,
          title: AppLocale.faqs.getString(context),
          trailingImage: AppAssets.arrowDownSvgImage,
        ),
        verticalSpace(32),
      ],
    );
  }
}