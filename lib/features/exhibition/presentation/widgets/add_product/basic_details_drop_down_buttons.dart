import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/auth/sign_up/logic/sign_up_state.dart';
import 'package:home4u/features/products/logic/products_state.dart';

import '../../../../../core/helpers/shared_pref_helper.dart';
import '../../../../../core/helpers/shared_pref_keys.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/widgets/app_custom_drop_down_button_form_field.dart';
import '../../../../../locale/app_locale.dart';
import '../../../../auth/sign_up/logic/sign_up_cubit.dart';
import '../../../../products/logic/products_cubit.dart';
import '../../../logic/business_add_product_cubit.dart';

class BasicDetailsDropDownButtons extends StatefulWidget {
  const BasicDetailsDropDownButtons({super.key});

  @override
  State<BasicDetailsDropDownButtons> createState() =>
      _BasicDetailsDropDownButtonsState();
}

class _BasicDetailsDropDownButtonsState
    extends State<BasicDetailsDropDownButtons> {
  String? selectedBusinessType;
  String? selectedBaseUnit;

  @override
  void initState() {
    super.initState();
    _loadUserType();
  }

  Future<void> _loadUserType() async {
    final userTypeId = await SharedPrefHelper.getInt(SharedPrefKeys.userTypeId);
    if (mounted) {
      context.read<SignUpCubit>().getBusinessTypes(userTypeId);
    }
  }

  @override
  Widget build(BuildContext context) {
    final businessCubit = context.read<BusinessAddProductCubit>();
    final signUpCubit = context.read<SignUpCubit>();
    final productsCubit = context.read<ProductsCubit>();

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      spacing: 16.h,
      children: [
        BlocBuilder<SignUpCubit, SignUpState>(
          builder: (context, state) {
            return AppCustomDropDownButtonFormField(
              value: selectedBusinessType,
              items: signUpCubit.businessTypes.map((businessType) {
                return DropdownMenuItem<String>(
                  value: businessType.id.toString(),
                  child: Text(
                    businessType.name,
                    style: AppStyles.font16BlackLight,
                  ),
                );
              }).toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    selectedBusinessType = value;
                    businessCubit.selectedExhibitionBusinessType =
                        int.parse(value);
                  });
                }
              },
              onSaved: (value) {
                if (value != null) {
                  businessCubit.selectedExhibitionBusinessType =
                      int.parse(value);
                  log("selected Business Type: $value");
                }
              },
              labelText: AppLocale.businessType.getString(context),
            );
          },
        ),
        BlocBuilder<ProductsCubit, ProductsState>(
          builder: (context, state) {
            return AppCustomDropDownButtonFormField(
              value: selectedBaseUnit,
              items: productsCubit.baseUnits.map((material) {
                return DropdownMenuItem<String>(
                  value: material.id.toString(),
                  child: Text(
                    material.name!,
                    style: AppStyles.font16BlackLight,
                  ),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedBaseUnit = value;
                  businessCubit.selectedBaseUnit = int.parse(value!);
                });
              },
              onSaved: (value) {
                businessCubit.selectedBaseUnit = int.parse(value!);
              },
              labelText: AppLocale.baseUnit.getString(context),
            );
          },
        ),
      ],
    );
  }
}
