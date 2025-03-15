import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:home4u/features/products/logic/products_cubit.dart';

import '../../../../../core/utils/spacing.dart';
import '../../../../../core/widgets/app_custom_drop_down_multi_select_button.dart';
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
 List<String>? selectedCategories;
 List<String>? selectedMaterials;
  List<String>? selectedColor;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        final cubit = context.watch<ProductsCubit?>();
        return Column(
          children:<Widget> [
            verticalSpace(32),
            AppCustomDropDownMultiSelectButton(
              selectedValues: selectedCategories ?? [],
              items: cubit?.businessConfigModel?.data?.businessTypes
                  ?.map((BusinessType businessTypes) => businessTypes.name ?? 'N/A')
                  .toList() ??
                  [],
              labelText: AppLocale.businessTypes.getString(context),
              onChanged: (List<String> values) {
                setState(() {
                  selectedCategories = values;
                  cubit?.businessTypeIds = values.map((name) {
                    return cubit.businessConfigModel!.data!.businessTypes!
                        .firstWhere((businessTypes) => businessTypes.name == name)
                        .id;
                  }).toList();
                });
              },
              onSaved: (List<String>? values) {
                if (values != null) {
                  cubit?.businessTypeIds = values.map((name) {
                    return cubit.businessConfigModel!.data!.businessTypes!
                        .firstWhere((color) => color.name == name)
                        .id;
                  }).toList();
                }
              },
            ),
            verticalSpace(16),
            AppCustomDropDownMultiSelectButton(
              selectedValues: selectedMaterials ?? [],
              items: cubit?.businessConfigModel?.data?.productMaterial
                  ?.map((ProductMaterial material) => material.name ?? 'N/A')
                  .toList() ??
                  [],
              labelText: AppLocale.material.getString(context),
              onChanged: (List<String> values) {
                setState(() {
                  selectedMaterials = values;
                  cubit?.materialIds = values.map((name) {
                    return cubit.businessConfigModel!.data!.productMaterial!
                        .firstWhere((material) => material.name == name)
                        .id;
                  }).toList();
                });
              },
              onSaved: (List<String>? values) {
                if (values != null) {
                  cubit?.materialIds = values.map((name) {
                    return cubit.businessConfigModel!.data!.productMaterial!
                        .firstWhere((color) => color.name == name)
                        .id;
                  }).toList();
                }
              },
            ),

            verticalSpace(16),
            AppCustomDropDownMultiSelectButton(
              selectedValues: selectedColor ?? [],
              items: cubit?.businessConfigModel?.data?.colors
                  ?.map((FilterColor color) => color.name ?? 'N/A')
                  .toList() ??
                  [],
              labelText: AppLocale.colors.getString(context),
              onChanged: (List<String> values) {
                setState(() {
                  selectedColor = values;
                  cubit?.colorsIds = values.map((name) {
                    return cubit.businessConfigModel!.data!.colors!
                        .firstWhere((color) => color.name == name)
                        .id;
                  }).toList();
                });
              },
              onSaved: (List<String>? values) {
                if (values != null) {
                  cubit?.colorsIds = values.map((name) {
                    return cubit.businessConfigModel!.data!.colors!
                        .firstWhere((color) => color.name == name)
                        .id;
                  }).toList();
                }
              },
            ),
            verticalSpace(16),
          ],
        );
      },
    );
  }
}
