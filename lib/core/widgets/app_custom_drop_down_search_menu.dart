import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home4u/locale/app_locale.dart';

import '../theming/app_assets.dart';
import '../theming/app_colors.dart';
import '../theming/app_styles.dart';

class AppCustomDropDownSearchMenu extends StatelessWidget {
  final String icon;
  final void Function(String?) onItemSelected;

  const AppCustomDropDownSearchMenu({super.key, required this.onItemSelected, this.icon=AppAssets.menuBlackImageSvg });

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<(Widget, String)>(
      clickProps: ClickProps(borderRadius: BorderRadius.circular(20.r)),
      mode: Mode.custom,
      items: (f, cs) => [
        (SvgPicture.asset(AppAssets.deleteSvgImage), AppLocale.delete.getString(context)),
        (SvgPicture.asset(AppAssets.editSvgImage), AppLocale.edit.getString(context)),
      ],
      compareFn: (item, selectedItem) => item == selectedItem,
      onChanged: (value) => onItemSelected(value?.$2),
      popupProps: PopupProps.menu(
        menuProps: MenuProps(
          align: MenuAlign.bottomCenter,
          backgroundColor: AppColors.whiteColor,
          shadowColor: AppColors.blackColor.withValues(alpha: 0.8),
          borderRadius: BorderRadius.circular(16.r),
        ),
        fit: FlexFit.loose,
        itemBuilder: (context, item, isDisabled, isSelected) {
          return ListTile(
            title: Text(
              item.$2,
              style: AppStyles.font16BlackMedium,
            ),
            leading: item.$1,
          );
        },
      ),
      dropdownBuilder: (ctx, selectedItem) => SvgPicture.asset(
        icon,
      ),
    );
  }
}
