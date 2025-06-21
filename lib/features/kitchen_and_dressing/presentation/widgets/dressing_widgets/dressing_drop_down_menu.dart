import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:hive/hive.dart';
import 'package:home4u/features/kitchen_and_dressing/logic/kitchen_and_dressing_cubit.dart';
import 'package:home4u/locale/app_locale.dart';

import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../core/utils/spacing.dart';
import '../../../../../core/widgets/app_custom_drop_down_button_form_field.dart';
import '../../../../../core/widgets/app_custom_drop_down_multi_select_button.dart';
import '../../../../auth/sign_up/logic/sign_up_cubit.dart';
import '../../../../products/data/models/business_config_model.dart';
import '../../../data/models/dressing_request_model.dart';

class DressingDropDownMenu extends StatefulWidget {
  const DressingDropDownMenu({super.key});

  @override
  State<DressingDropDownMenu> createState() => _DressingDropDownMenuState();
}

class _DressingDropDownMenuState extends State<DressingDropDownMenu> {
  String? selectedGovernorate;
  List<ProductMaterial> productMaterials = [];
  List<String> selectedProductMaterials = [];

  @override
  void initState() {
    super.initState();
    context.read<SignUpCubit>().getGovernorates();
    _loadProductMaterialsTypes();

  }
  Future<void> _loadProductMaterialsTypes() async {
    final appInitBox =
    await Hive.openBox<BusinessConfigModel>(kBusinessConfigBox);
    final appInitData = appInitBox.get(kBusinessConfigData);
    productMaterials = appInitData?.data?.productMaterial ?? [];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<KitchenAndDressingCubit>();
    return Column(
      children: [
        verticalSpace(16),
        AppCustomDropDownMultiSelectButton(
          validator: (value) {
            if (value?.isEmpty ?? true) {
              return "Please select at least one Material";
            }
            return null;
          },
          selectedValues: selectedProductMaterials ?? [],
          items: productMaterials
              .map((productMaterials) {
            return productMaterials.name ?? 'N/A';
          }).toList(),
          labelText:
          AppLocale.engineeringOfficeDepartments.getString(context),
          onChanged: (List<String> values) {
            setState(() {
              selectedProductMaterials = values;
              cubit.productMaterial = values.map((name) {
                final match = productMaterials.firstWhere(
                      (m) => m.name == name,
                  orElse: () => ProductMaterial(id: 0),
                );
                return match.id != null && match.id != 0 ? IdModel(id: match.id!) : null;
              }).whereType<IdModel>().toList();
            });
          },
          onSaved: (value) {
            cubit.productMaterial = value!.map((name) {
              final match = productMaterials.firstWhere(
                    (m) => m.name == name,
                orElse: () => ProductMaterial(id: 0),
              );
              return match.id != null && match.id != 0 ? IdModel(id: match.id!) : null;
            }).whereType<IdModel>().toList();
          },
        ),
        verticalSpace(16),
        AppCustomDropDownButtonFormField(
          value: selectedGovernorate,
          items: context.read<SignUpCubit>().governorates.map((governorate) {
            return DropdownMenuItem<String>(
              value: governorate.id.toString(),
              child: Text(
                governorate.name,
                style: AppStyles.font16BlackLight,
              ),
            );
          }).toList(),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return AppLocale.pleaseSelectGovernorate.getString(context);
            }
            return null;
          },
          onChanged: (value) {
            setState(() {
              selectedGovernorate = value;
              cubit.governmentId = int.parse(value!);
            });
          },
          labelText: AppLocale.theGovernorate.getString(context),
        ),
        verticalSpace(16),
      ],
    );
  }
}
