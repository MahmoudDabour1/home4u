import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/user/renovate_your_house/logic/renovate_your_house_cubit.dart';
import 'package:home4u/features/user/renovate_your_house/logic/renovate_your_house_state.dart';
import 'package:home4u/features/user/request_design/logic/request_design_cubit.dart';

import '../../../../../../core/theming/app_styles.dart';
import '../../../../../../core/utils/spacing.dart';
import '../../../../../../core/widgets/app_custom_drop_down_button_form_field.dart';
import '../../../../../../locale/app_locale.dart';

class RequestCustomDesignDropDowns extends StatefulWidget {
  const RequestCustomDesignDropDowns({super.key});

  @override
  State<RequestCustomDesignDropDowns> createState() =>
      _RequestCustomDesignDropDownsState();
}

class _RequestCustomDesignDropDownsState
    extends State<RequestCustomDesignDropDowns> {
  String? selectedUnitType;
  String? selectedGovernorate;

  @override
  void initState() {
    super.initState();
    final cubit = context.read<RenovateYourHouseCubit>();
    cubit.getRenovateYourHouseLookUps();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RenovateYourHouseCubit, RenovateYourHouseState>(
      builder: (context, state) {
        final cubit = context.read<RenovateYourHouseCubit>();
        final requestDeignCubit = context.read<RequestDesignCubit>();
        return Column(
          spacing: 16.h,
          children: [
            verticalSpace(16),
            AppCustomDropDownButtonFormField(
              value: cubit.selectedUnitType != null
                  ? cubit.unitTypes
                      .firstWhere(
                          (unitType) => unitType.id == cubit.selectedUnitType)
                      .id
                      .toString()
                  : selectedUnitType,
              items: cubit.unitTypes.map((unitType) {
                return DropdownMenuItem<String>(
                  value: unitType.id.toString(),
                  child: Text(
                    unitType.name,
                    style: AppStyles.font16BlackLight,
                  ),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedUnitType = value;
                  requestDeignCubit.selectedUnitType = int.parse(value!);
                });
              },
              onSaved: (value) {
                requestDeignCubit.selectedUnitType = int.parse(value!);
              },
              labelText: AppLocale.unitType.getString(context),
            ),
            AppCustomDropDownButtonFormField(
              value: selectedGovernorate,
              items: cubit.governorates.map((governorate) {
                return DropdownMenuItem<String>(
                  value: governorate.id.toString(),
                  child: Text(
                    governorate.name,
                    style: AppStyles.font16BlackLight,
                  ),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedGovernorate = value;
                  // selectedCity = null;
                  // signUpCubit.getCities(int.parse(value!));
                  requestDeignCubit.selectedGovernorate = int.parse(value!);
                });
              },
              onSaved: (value) {
                requestDeignCubit.selectedGovernorate = int.parse(value!);
              },
              labelText: AppLocale.theGovernorate.getString(context),
            ),
          ],
        );
      },
    );
  }
}
