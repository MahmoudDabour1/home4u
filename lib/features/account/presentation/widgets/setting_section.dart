import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/shared_pref_helper.dart';
import '../../../../core/helpers/shared_pref_keys.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_styles.dart';
import '../../../../core/utils/spacing.dart';
import '../../../settings/presentation/widgets/language_dropdown_sheet.dart';
import 'list_tile_item.dart';

class SettingSection extends StatefulWidget {
  const SettingSection({super.key});

  @override
  State<SettingSection> createState() => _SettingSectionState();
}

class _SettingSectionState extends State<SettingSection> {
  // String? language;
  String? selectedLanguage;

  Future<void> getLanguage() async {
    final languageLocal =
        await SharedPrefHelper.getString(SharedPrefKeys.selectedLocale);
    if (languageLocal != null) {
      setState(() {
        selectedLanguage = languageLocal;
      });
    }
  }

  String get selectedLanguageName {
    switch (selectedLanguage) {
      case 'en':
        return 'English';
      case 'ar':
        return 'العربية';
      default:
        return '';
    }
  }

  @override
  void initState() {
    super.initState();
    getLanguage();
  }

  @override
  Widget build(BuildContext context) {
    // language == "en" ? selectedLanguage = "English" : selectedLanguage = "العربية";
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpace(16),
        Text(
          'Settings',
          style: AppStyles.font20BlackMedium,
        ),
        verticalSpace(8),
        Container(
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Column(
            children: [
              ListTileItem(
                imageUrl: "assets/images/language_icon.png",
                title: "Language",
                isHaveTitleDetails: true,
                titleDetails: Text(
                  selectedLanguageName ?? "",
                  style: AppStyles.font16BlackLight,
                ),
                onTap: () async {
                  showLanguageDropdownSheet(context);
                  await getLanguage();
                },
              ),
              ListTileItem(
                imageUrl: "assets/images/country_icon.png",
                title: "Country",
                onTap: () {},
              ),
              ListTileItem(
                leadingIcon: Icons.sports_basketball,
                title: "Notifications",
                imageUrl: "assets/images/notification_icon.png",
                onTap: () {},
                isLastItem: true,
              ),
            ],
          ),
        ),
        verticalSpace(32)
      ],
    );
  }
}
