import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/cart/presentation/widgets/custom_choose_furniture_or_decor_widget.dart';
import 'package:home4u/locale/app_locale.dart';

import '../../../../core/theming/app_assets.dart';

class CustomChooseDecorOrFurnitureItems extends StatefulWidget {
  const CustomChooseDecorOrFurnitureItems({
    super.key,
  });

  @override
  State<CustomChooseDecorOrFurnitureItems> createState() =>
      _CustomChooseDecorOrFurnitureItemsState();
}

class _CustomChooseDecorOrFurnitureItemsState
    extends State<CustomChooseDecorOrFurnitureItems> {
  bool isCustomFurnitureSelected = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 16.w,
      children: [
        CustomChooseFurnitureOrDecorWidget(
          image: AppAssets.customFurnitureSvg,
          title: AppLocale.customFurniture.getString(context),
          subTitle: AppLocale.customFurnitureSubTitle.getString(context),
          isSelected: isCustomFurnitureSelected,
          onTap: () {
            setState(() {
              isCustomFurnitureSelected = true;
            });
          },
        ),
        CustomChooseFurnitureOrDecorWidget(
          image: AppAssets.decorSvg,
          title: AppLocale.decor.getString(context),
          subTitle: AppLocale.decorSubTitle.getString(context),
          isSelected: !isCustomFurnitureSelected,
          onTap: () {
            setState(() {
              isCustomFurnitureSelected = false;
            });
          },
        ),
      ],
    );
  }
}
