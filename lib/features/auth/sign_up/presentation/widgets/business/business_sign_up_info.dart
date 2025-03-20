import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/utils/spacing.dart';

import '../../../../../../core/widgets/app_custom_drop_down_multi_select_button.dart';
import '../../../../../../core/widgets/app_text_form_field.dart';
import '../../../../../../locale/app_locale.dart';
import '../../../logic/sign_up_cubit.dart';
import 'business_sign_up_button.dart';

class BusinessSignUpInfo extends StatefulWidget {
  const BusinessSignUpInfo({super.key});

  @override
  State<BusinessSignUpInfo> createState() => _BusinessSignUpInfoState();
}

class _BusinessSignUpInfoState extends State<BusinessSignUpInfo> {
  late FocusNode _tradeNameFocusNode;
  late FocusNode _bioArFocusNode;
  late FocusNode _bioEnFocusNode;
  late FocusNode _businessTypesFocusNode;
  List<String>? selectedBusinessTypes;

  @override
  void initState() {
    super.initState();
    _tradeNameFocusNode = FocusNode();
    _bioArFocusNode = FocusNode();
    _bioEnFocusNode = FocusNode();
    _businessTypesFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _tradeNameFocusNode.dispose();
    _bioArFocusNode.dispose();
    _bioEnFocusNode.dispose();
    _businessTypesFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final signUpCubit = context.read<SignUpCubit>();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        spacing: 16.h,
        children: [
          verticalSpace(16),
          AppTextFormField(
            controller: signUpCubit.tradNameController,
            labelText: AppLocale.tradeName.getString(context),
            focusNode: _tradeNameFocusNode,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value.isEmpty) {
                return "Please enter your trade name";
              }
              return null;
            },
          ),
          AppTextFormField(
            controller: signUpCubit.bioEnController,
            labelText: AppLocale.bioEn.getString(context),
            focusNode: _bioEnFocusNode,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value.isEmpty) {
                return "Please enter your bio in english";
              }
              return null;
            },
          ),
          AppTextFormField(
            controller: signUpCubit.bioArController,
            labelText: AppLocale.bioAr.getString(context),
            focusNode: _bioArFocusNode,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value.isEmpty) {
                return "Please enter your bio in arabic";
              }
              return null;
            },
          ),

          ///ToDo : problem when choose exhibition and go to second screen ,then return and choose store show the same data first and then show store data and vice versa is true
          AppCustomDropDownMultiSelectButton(
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return "Please select at least one service";
              }
              return null;
            },
            selectedValues: selectedBusinessTypes ?? [],
            items: signUpCubit.businessTypes.map((businessType) {
              return businessType.name ?? 'N/A';
            }).toList(),
            labelText: AppLocale.businessTypes.getString(context),
            onChanged: (List<String> values) {
              setState(() {
                selectedBusinessTypes = values;
                signUpCubit.selectedBusinessTypes = values.map((name) {
                  return signUpCubit.businessTypes
                      .firstWhere((businessType) => businessType.name == name)
                      .id;
                }).toList();
              });
            },
            onSaved: (value) {
              signUpCubit.selectedBusinessTypes = value?.map((name) {
                return signUpCubit.businessTypes
                    .firstWhere((businessType) => businessType.name == name)
                    .id;
              }).toList();
            },
          ),
          verticalSpace(16),
          BusinessSignUpButton(
            onPressed: () {
              final checkInputs = signUpCubit.formKey.currentState!.validate();
              if (checkInputs) {
                signUpCubit.emitSignUp();
              }
            },
          ),
        ],
      ),
    );
  }
}
