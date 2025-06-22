import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:hive/hive.dart';
import 'package:home4u/features/kitchen_and_dressing/data/models/kitchen_request_model.dart';

import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../core/utils/spacing.dart';
import '../../../../../core/widgets/app_custom_drop_down_button_form_field.dart';
import '../../../../../core/widgets/app_custom_drop_down_multi_select_button.dart';
import '../../../../../locale/app_locale.dart';
import '../../../../auth/sign_up/logic/sign_up_cubit.dart';
import '../../../../products/data/models/business_config_model.dart';
import '../../../logic/kitchen_and_dressing_cubit.dart';

class KitchenDropDownMenu extends StatefulWidget {
  const KitchenDropDownMenu({super.key});

  @override
  State<KitchenDropDownMenu> createState() => _KitchenDropDownMenuState();
}

class _KitchenDropDownMenuState extends State<KitchenDropDownMenu> {
  String? selectedGovernorate;
  List<ProductMaterial> productMaterials = [];
  List<String> selectedProductMaterials = [];
  List<DevicesAttached> devicesAttached = [];
  List<String> selectedDevicesAttached = [];
  List<DevicesAttached> kitchenType = [];
  String? selectedKitchenType;

  @override
  void initState() {
    super.initState();
    context.read<SignUpCubit>().getGovernorates();
    _loadPDataTypes();
  }

  Future<void> _loadPDataTypes() async {
    final appInitBox =
        await Hive.openBox<BusinessConfigModel>(kBusinessConfigBox);
    final appInitData = appInitBox.get(kBusinessConfigData);
    productMaterials = appInitData?.data?.productMaterial ?? [];
    devicesAttached = appInitData?.data?.devicesAttacheds ?? [];
    kitchenType = appInitData?.data?.kitchenTypes ?? [];
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
          items: productMaterials.map((productMaterials) {
            return productMaterials.name ?? 'N/A';
          }).toList(),
          labelText: AppLocale.productMaterials.getString(context),
          onChanged: (List<String> values) {
            setState(() {
              selectedProductMaterials = values;
              cubit.kitchenProductMaterial = values
                  .map((name) {
                    final match = productMaterials.firstWhere(
                      (m) => m.name == name,
                      orElse: () => ProductMaterial(id: 0),
                    );
                    return match.id != null && match.id != 0
                        ? KitchenIdModel(id: match.id!)
                        : null;
                  })
                  .whereType<KitchenIdModel>()
                  .toList();
            });
          },
          onSaved: (value) {
            cubit.kitchenProductMaterial = value!
                .map((name) {
                  final match = productMaterials.firstWhere(
                    (m) => m.name == name,
                    orElse: () => ProductMaterial(id: 0),
                  );
                  return match.id != null && match.id != 0
                      ? KitchenIdModel(id: match.id!)
                      : null;
                })
                .whereType<KitchenIdModel>()
                .toList();
          },
        ),
        verticalSpace(16),
        AppCustomDropDownMultiSelectButton(
          validator: (value) {
            if (value?.isEmpty ?? true) {
              return "Please select at least one Material";
            }
            return null;
          },
          selectedValues: selectedDevicesAttached ?? [],
          items: devicesAttached.map((devicesAttached) {
            return devicesAttached.name ?? 'N/A';
          }).toList(),
          labelText: AppLocale.devicesAttached.getString(context),
          onChanged: (List<String> values) {
            setState(() {
              selectedDevicesAttached = values;
              cubit.devicesAttached = values
                  .map((name) {
                    final match = devicesAttached.firstWhere(
                      (m) => m.name == name,
                      orElse: () => DevicesAttached(id: 0),
                    );
                    return match.id != null && match.id != 0
                        ? KitchenIdModel(id: match.id!)
                        : null;
                  })
                  .whereType<KitchenIdModel>()
                  .toList();
            });
          },
          onSaved: (value) {
            cubit.devicesAttached = value!
                .map((name) {
                  final match = devicesAttached.firstWhere(
                    (m) => m.name == name,
                    orElse: () => DevicesAttached(id: 0),
                  );
                  return match.id != null && match.id != 0
                      ? KitchenIdModel(id: match.id!)
                      : null;
                })
                .whereType<KitchenIdModel>()
                .toList();
          },
        ),
        verticalSpace(16),
        AppCustomDropDownButtonFormField(
          value: selectedKitchenType,
          items: kitchenType.map((kitchenType) {
            return DropdownMenuItem<String>(
              value: kitchenType.id.toString(),
              child: Text(
                kitchenType.name ?? '',
                style: AppStyles.font16BlackLight,
              ),
            );
          }).toList(),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return AppLocale.kitchenType.getString(context);
            }
            return null;
          },
          onChanged: (value) {
            setState(() {
              selectedKitchenType = value;
              cubit.kitchenType = int.parse(value!);
            });
          },
          labelText: AppLocale.kitchenType.getString(context),
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
