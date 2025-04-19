import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/user/renovate_your_house/logic/renovate_your_house_state.dart';

import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/widgets/app_custom_drop_down_button_form_field.dart';
import '../../../../../locale/app_locale.dart';
import '../../logic/renovate_your_house_cubit.dart';

class RenovateYourHouseFirstInfoDropDowns extends StatefulWidget {
  const RenovateYourHouseFirstInfoDropDowns({super.key});

  @override
  State<RenovateYourHouseFirstInfoDropDowns> createState() =>
      _RenovateYourHouseFirstInfoDropDownsState();
}

class _RenovateYourHouseFirstInfoDropDownsState
    extends State<RenovateYourHouseFirstInfoDropDowns> {
  String? selectedUnitType;
  bool? isInsideCompound;

  @override
  void initState() {
    super.initState();
    context.read<RenovateYourHouseCubit>().getRenovateYourHouseLookUps();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RenovateYourHouseCubit, RenovateYourHouseState>(
      builder: (context, state) {
        final cubit = context.read<RenovateYourHouseCubit>();

        return Column(
          spacing: 16.h,
          children: [
            AppCustomDropDownButtonFormField(
              value: selectedUnitType,
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
                  cubit.selectedUnitType = int.parse(value!);
                });
              },
              onSaved: (value) {
                cubit.selectedUnitType = int.parse(value!);
              },
              labelText: AppLocale.unitType.getString(context),
            ),
            AppCustomDropDownButtonFormField(
              value: isInsideCompound == null
                  ? null
                  : isInsideCompound!
                      ? 'true'
                      : 'false',
              items: [
                DropdownMenuItem<String>(
                  value: 'true',
                  child: Text(
                    AppLocale.insideCompound.getString(context),
                    style: AppStyles.font16BlackLight,
                  ),
                ),
                DropdownMenuItem<String>(
                  value: 'false',
                  child: Text(
                    AppLocale.outsideCompound.getString(context),
                    style: AppStyles.font16BlackLight,
                  ),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  isInsideCompound = value == 'true';
                  cubit.isInsideCompound = isInsideCompound;
                });
              },
              labelText: AppLocale.unitInsideCompound.getString(context),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please select a unit status';
                }
                return null;
              },
            ),
          ],
        );
      },
    );
  }
}
