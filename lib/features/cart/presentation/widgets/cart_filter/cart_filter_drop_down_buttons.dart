import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/cart/logic/cart_cubit.dart';

import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/utils/spacing.dart';
import '../../../../../core/widgets/app_custom_drop_down_button_form_field.dart';
import '../../../../../locale/app_locale.dart';
import '../../../../products/logic/products_cubit.dart';
import '../../../../products/logic/products_state.dart';

class CartFilterDropDownButtons extends StatefulWidget {
  const CartFilterDropDownButtons({super.key});

  @override
  State<CartFilterDropDownButtons> createState() =>
      _CartFilterDropDownButtonsState();
}

class _CartFilterDropDownButtonsState extends State<CartFilterDropDownButtons> {
  String? selectedBusinessType;
  String? selectedBusinessTypeCategory;
  List<String>? selectedMaterials;
  List<String>? selectedColor;

  @override
  Widget build(BuildContext context) {
    final productCubit = context.read<ProductsCubit>();
    final cubit = context.watch<CartCubit>();
    selectedMaterials = cubit.selectedMaterialNames ?? [];
    selectedColor = cubit.selectedColorNames ?? [];
     selectedBusinessType = cubit.selectedBusinessType?.toString();
     selectedBusinessTypeCategory =
    cubit.selectedBusinessTypeCategory?.toString();
    return Column(
      spacing: 8.h,
      children: [
        verticalSpace(16),
        AppCustomDropDownButtonFormField(
          value: selectedBusinessType,
          items: productCubit.businessTypes!.map((businessType) {
            return DropdownMenuItem<String>(
              value: businessType.id.toString(),
              child: Text(
                businessType.name ?? '',
                style: AppStyles.font16BlackLight,
              ),
            );
          }).toList(),
          onChanged: (value) {
            if (value != null) {
              setState(() {
                selectedBusinessType = value;
                selectedBusinessTypeCategory = null;
                cubit.selectedBusinessType = int.parse(value);
                cubit.selectedBusinessTypeCategory = null;
              });
            }
          },
          onSaved: (value) {
            if (value != null) {
              cubit.selectedBusinessType = int.parse(value);
              log("selected Business Type: $value");
            }
          },
          labelText: AppLocale.businessType.getString(context),
        ),
        BlocBuilder<ProductsCubit, ProductsState>(
          builder: (context, state) {
            final productsCubit = context.read<ProductsCubit?>();
            final cubit = context.read<CartCubit?>();
            return Column(
              spacing: 16.h,
              children: [
                AppCustomDropDownButtonFormField(
                  isEnabled: selectedBusinessType != null &&
                      productsCubit?.businessTypeCategories != null,
                  value: selectedBusinessTypeCategory,
                  items: productsCubit!.businessTypeCategories!
                      .where((category) =>
                          category.businessType?.id.toString() ==
                          selectedBusinessType)
                      .map((category) {
                    return DropdownMenuItem<String>(
                      value: category.id.toString(),
                      child: Text(
                        category.name!,
                        style: AppStyles.font16BlackLight,
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedBusinessTypeCategory = value;
                      cubit?.selectedBusinessTypeCategory = int.parse(value!);
                    });
                  },
                  onSaved: (value) {
                    cubit?.selectedBusinessTypeCategory = int.parse(value!);
                  },
                  labelText: AppLocale.businessTypeCategory.getString(context),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
