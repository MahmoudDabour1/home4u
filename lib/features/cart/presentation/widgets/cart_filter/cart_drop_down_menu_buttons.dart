import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:home4u/features/cart/logic/cart_cubit.dart';

import '../../../../../core/utils/spacing.dart';
import '../../../../../core/widgets/app_custom_drop_down_multi_select_button.dart';
import '../../../../../locale/app_locale.dart';
import '../../../../products/data/models/business_config_model.dart';
import '../../../../products/logic/products_cubit.dart';
import '../../../../products/logic/products_state.dart';

class CartDropDownMenuButtons extends StatefulWidget {
  const CartDropDownMenuButtons({super.key});

  @override
  State<CartDropDownMenuButtons> createState() => _CartDropDownMenuButtonsState();
}

class _CartDropDownMenuButtonsState extends State<CartDropDownMenuButtons> {
  List<String>? selectedCategories;
  List<String>? selectedMaterials;
  List<String>? selectedColor;


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        final cubit = context.watch<ProductsCubit?>();
        final cartCubit = context.read<CartCubit>();
        selectedCategories = cubit?.selectedBusinessTypeNames ?? [];
        selectedMaterials = cubit?.selectedMaterialNames ?? [];
        selectedColor = cubit?.selectedColorNames ?? [];
        return Column(
          children:<Widget> [
            verticalSpace(32),
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
                  cartCubit.materialIds = values.map((name) {
                    return cubit?.businessConfigModel!.data!.productMaterial!
                        .firstWhere((material) => material.name == name)
                        .id;
                  }).toList();
                  cartCubit.selectedMaterialNames = values;
                });
              },
              onSaved: (List<String>? values) {
                if (values != null) {
                  cartCubit.materialIds = values.map((name) {
                    return cubit?.businessConfigModel!.data!.productMaterial!
                        .firstWhere((color) => color.name == name)
                        .id;
                  }).toList();
                  cartCubit.selectedMaterialNames = values;
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
                  cartCubit.colorsIds = values.map((name) {
                    return cubit?.businessConfigModel!.data!.colors!
                        .firstWhere((color) => color.name == name)
                        .id;
                  }).toList();
                  cartCubit.selectedColorNames = values;
                });
              },
              onSaved: (List<String>? values) {
                if (values != null) {
                  cartCubit.colorsIds = values.map((name) {
                    return cubit?.businessConfigModel!.data!.colors!
                        .firstWhere((color) => color.name == name)
                        .id;
                  }).toList();
                  cartCubit.selectedColorNames = values;
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
