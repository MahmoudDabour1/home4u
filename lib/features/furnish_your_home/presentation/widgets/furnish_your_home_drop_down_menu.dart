import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:hive/hive.dart';

import '../../../../core/theming/app_styles.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../core/utils/spacing.dart';
import '../../../../core/widgets/app_custom_drop_down_button_form_field.dart';
import '../../../../locale/app_locale.dart';
import '../../../auth/sign_up/logic/sign_up_cubit.dart';
import '../../../products/data/models/business_config_model.dart';
import '../../logic/furnish_your_home_cubit.dart';

class FurnishYourHomeDropDownMenu extends StatefulWidget {
  const FurnishYourHomeDropDownMenu({super.key});

  @override
  State<FurnishYourHomeDropDownMenu> createState() =>
      _FurnishYourHomeDropDownMenuState();
}

class _FurnishYourHomeDropDownMenuState
    extends State<FurnishYourHomeDropDownMenu> {
  List<DevicesAttached> furnitureTypes = [];
  String? selectFurnishType;
  String? selectedGovernorate;

  @override
  initState() {
    super.initState();
    context.read<SignUpCubit>().getGovernorates();
    _loadGovernmentAndFurnishTypes();
  }

  Future<void> _loadGovernmentAndFurnishTypes() async {
    final appInitBox =
        await Hive.openBox<BusinessConfigModel>(kBusinessConfigBox);
    final appInitData = appInitBox.get(kBusinessConfigData);
    furnitureTypes = appInitData?.data?.furnitureTypes ?? [];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<FurnishYourHomeCubit>();
    return Column(
      children: [
        verticalSpace(16),
        AppCustomDropDownButtonFormField(
          value: selectFurnishType,
          items: furnitureTypes.map((item) {
            return DropdownMenuItem<String>(
              value: item.id.toString(),
              child: Text(
                item.name ?? "",
                style: AppStyles.font16BlackLight,
              ),
            );
          }).toList(),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return AppLocale.pleaseSelectFurnishType.getString(context);

            }
            return null;
          },
          onChanged: (value) {
            setState(() {
              selectFurnishType = value;
              cubit.furnitureTypeId = int.parse(value!);
            });
          },
          labelText: AppLocale.furnishType.getString(context),
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
