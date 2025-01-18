import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/extensions/navigation_extension.dart';
import 'package:home4u/core/helpers/shared_pref_helper.dart';
import 'package:home4u/core/helpers/shared_pref_keys.dart';
import 'package:home4u/core/routing/routes.dart';
import 'package:home4u/core/theming/app_colors.dart';
import 'package:home4u/core/widgets/app_custom_button.dart';
import 'package:home4u/features/settings/presentation/widgets/switch_list_tile_widget.dart';

import '../../../../core/localization/app_localization_cubit.dart';
import '../../../../core/localization/app_localization_state.dart';
import '../../../../core/theming/app_assets.dart';
import '../../../../core/theming/app_styles.dart';
import '../../../../core/utils/spacing.dart';
import '../../../../locale/app_locale.dart';
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
            _showLanguageDropdownSheet(context);
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

void _showLanguageDropdownSheet(BuildContext context) {
  String? selectedLanguage =
      context.read<AppLocalizationCubit>().appLocale == AppLocale.en
          ? 'English'
          : 'Arabic';

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.r),
                topRight: Radius.circular(20.r),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Divider(
                  height: 1.0,
                  thickness: 2,
                  indent: MediaQuery.sizeOf(context).width / 2 - 60,
                  endIndent: MediaQuery.sizeOf(context).width / 2 - 60,
                  color: AppColors.primaryColor,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    onPressed: () {
                      context.pop();
                    },
                    icon: Icon(
                      Icons.close,
                      size: 24.r,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
                ListTile(
                  trailing:
                      Icon(selectedLanguage == 'Arabic' ? Icons.check : null),
                  title: Text('العربية'),
                  onTap: () {
                    setState(() {
                      selectedLanguage = 'Arabic';
                    });
                  },
                ),
                ListTile(
                  trailing:
                      Icon(selectedLanguage == 'English' ? Icons.check : null),
                  title: Text('English'),
                  onTap: () {
                    setState(() {
                      selectedLanguage = 'English';
                    });
                  },
                ),
                SizedBox(height: 8.0),
                BlocBuilder<AppLocalizationCubit, AppLocalizationState>(
                  builder: (context, state) {
                    return AppCustomButton(
                        textButton: AppLocale.confirm.getString(context),
                        btnWidth: MediaQuery.sizeOf(context).width * 0.3,
                        btnHeight: MediaQuery.sizeOf(context).height * 0.0001,
                        onPressed: () {
                          context.read<AppLocalizationCubit>().changeLocale(
                              selectedLanguage == 'Arabic' ? 'ar' : 'en');
                          context.pop();
                        });
                  },
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
