import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/products/logic/products_cubit.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/utils/spacing.dart';
import '../../../../../core/widgets/app_custom_drop_down_button_form_field.dart';
import '../../../../../locale/app_locale.dart';
import '../../../data/models/business_config_model.dart';
import '../../../logic/products_state.dart';

class FilterDropDownMenuButtons extends StatefulWidget {
  const FilterDropDownMenuButtons({super.key});

  @override
  State<FilterDropDownMenuButtons> createState() =>
      _FilterDropDownMenuButtonsState();
}

class _FilterDropDownMenuButtonsState extends State<FilterDropDownMenuButtons> {
  String? selectedCategories;
  String? selectedMaterials;
  String? selectedColor;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        final cubit = context.watch<ProductsCubit?>();
        return Column(
          children:<Widget> [
            verticalSpace(32),
            AppCustomDropDownButtonFormField(
              value: selectedCategories,
              items: cubit?.businessConfigModel?.data?.businessTypes
                      ?.map<DropdownMenuItem<String>>(
                    (BusinessType businessType) {
                      return DropdownMenuItem<String>(
                        value: businessType.id.toString(),
                        child: Text(
                          businessType.name!,
                          style: AppStyles.font16BlackLight,
                        ),
                      );
                    },
                  ).toList() ??
                  [],
              onChanged: (value) {
                setState(() {
                  if (value != null) {
                    selectedCategories = value;
                    final categoryId = int.parse(value);
                    if (!cubit!.colorsIds.contains(categoryId)) {
                      cubit.businessTypeIds.add(categoryId);
                    }
                  }
                });
              },
              labelText: AppLocale.categories.getString(context),
              fillColor: AppColors.whiteColor,
            ),
            verticalSpace(16),
            AppCustomDropDownButtonFormField(
              value: selectedMaterials,
              items: cubit?.businessConfigModel?.data?.productMaterial
                      ?.map<DropdownMenuItem<String>>(
                    (ProductMaterial materials) {
                      return DropdownMenuItem<String>(
                        value: materials.id.toString(),
                        child: Text(
                          materials.name??'',
                          style: AppStyles.font16BlackLight,
                        ),
                      );
                    },
                  ).toList() ??
                  [],
              onChanged: (value) {
                setState(() {
                  selectedColor = value;
                  cubit?.colorsIds = [int.parse(value!)];
                });
              },
              labelText: AppLocale.material.getString(context),
              fillColor: AppColors.whiteColor,
            ),
            verticalSpace(16),
            AppCustomDropDownButtonFormField(
              value: selectedColor,
              items: cubit?.businessConfigModel?.data?.colors
                      ?.map<DropdownMenuItem<String>>(
                    (FilterColor color) {
                      return DropdownMenuItem<String>(
                        value: color.id.toString(),
                        child: Row(
                          children: [
                            Container(
                              height: 30.h,
                              width: 30.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.r),
                                color: Color(int.parse(
                                    '0xFF${color.hexColor!.replaceAll('#', '')}')),
                              ),
                            ),
                            horizontalSpace(8),
                            Text(
                              color.name??'',
                              style: AppStyles.font16BlackLight,
                            ),
                          ],
                        ),
                      );
                    },
                  ).toList() ??
                  [],
              onChanged: (value) {
                setState(() {
                  if (value != null) {
                    selectedColor = value;
                    final colorId = int.parse(value);
                    if (!cubit!.colorsIds.contains(colorId)) {
                      cubit.colorsIds.add(colorId);
                    }
                  }
                });
              },
              labelText: AppLocale.colors.getString(context),
              fillColor: AppColors.whiteColor,
            ),
            verticalSpace(16),
          ],
        );
      },
    );
  }
}
