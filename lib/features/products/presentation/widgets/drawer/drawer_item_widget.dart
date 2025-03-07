import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home4u/features/products/presentation/widgets/drawer/products_drawer.dart';
import 'package:home4u/locale/app_locale.dart';

import '../../../../../core/theming/app_assets.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';

class DrawerItemWidget extends StatelessWidget {
  final DrawerItem item;
  final bool isSelected;
  final VoidCallback onTap;

  const DrawerItemWidget({
    super.key,
    required this.item,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final icon = getIconForItem(item);
    final text = getTextForItem(item,context);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Container(
        height: 62.h,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.darkBlueColor : Colors.transparent,
        ),
        child: ListTile(
          leading: SvgPicture.asset(
            icon,
            height: 24.h,
          ),
          title: Text(
            text,
            style: AppStyles.font24DarkGrayMedium.copyWith(
              color:
                  isSelected ? AppColors.whiteColor : AppColors.darkGrayColor,
            ),
          ),
          onTap: onTap,
        ),
      ),
    );
  }

  String getIconForItem(DrawerItem item) {
    switch (item) {
      case DrawerItem.products:
        return AppAssets.productSvg;
      case DrawerItem.overview:
        return AppAssets.overViewSvg;
      case DrawerItem.settings:
        return AppAssets.settingDarkGraySvg;
      case DrawerItem.review:
        return AppAssets.reviewSvg;
      case DrawerItem.offers:
        return AppAssets.settingDarkGraySvg;
      case DrawerItem.addProduct:
        return AppAssets.addProductSvg;
    }
  }

  String getTextForItem(DrawerItem item, BuildContext context) {
    switch (item) {
      case DrawerItem.products:
        return AppLocale.products.getString(context);
      case DrawerItem.overview:
        return AppLocale.overview.getString(context);
      case DrawerItem.settings:
        return AppLocale.settings.getString(context);
      case DrawerItem.review:
        return AppLocale.review.getString(context);
      case DrawerItem.offers:
        return AppLocale.offers.getString(context);
      case DrawerItem.addProduct:
        return AppLocale.addProduct.getString(context);
    }
  }
}
