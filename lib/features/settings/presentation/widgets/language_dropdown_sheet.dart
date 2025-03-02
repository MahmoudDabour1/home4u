import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/extensions/navigation_extension.dart';
import 'package:home4u/core/theming/app_colors.dart';
import 'package:home4u/core/widgets/app_custom_button.dart';
import 'package:home4u/locale/app_locale.dart';

import '../../../../core/localization/app_localization_cubit.dart';
import '../../../../core/localization/app_localization_state.dart';

void showLanguageDropdownSheet(BuildContext context) {
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
