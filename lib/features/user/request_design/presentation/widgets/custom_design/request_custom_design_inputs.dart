import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/helpers/app_regex.dart';
import '../../../../../../core/widgets/app_text_form_field.dart';
import '../../../../../../core/widgets/get_common_input_decoration.dart';
import '../../../../../../locale/app_locale.dart';
import '../../../logic/request_design_cubit.dart';

class RequestCustomDesignInputs extends StatefulWidget {
  const RequestCustomDesignInputs({super.key});

  @override
  State<RequestCustomDesignInputs> createState() =>
      _RequestCustomDesignInputsState();
}

class _RequestCustomDesignInputsState extends State<RequestCustomDesignInputs> {
  late final FocusNode unitAreaFocusNode;
  late final FocusNode phoneNumberFocusNode;
  late final FocusNode budgetFocusNode;
  late final FocusNode requiredDurationFocusNode;
  late final FocusNode notesFocusNode;

  @override
  void initState() {
    super.initState();
    unitAreaFocusNode = FocusNode();
    phoneNumberFocusNode = FocusNode();
    budgetFocusNode = FocusNode();
    requiredDurationFocusNode = FocusNode();
    notesFocusNode = FocusNode();
  }

  @override
  void dispose() {
    unitAreaFocusNode.dispose();
    phoneNumberFocusNode.dispose();
    budgetFocusNode.dispose();
    requiredDurationFocusNode.dispose();
    notesFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RequestDesignCubit>();
    return Column(
      spacing: 16.h,
      children: [
        AppTextFormField(
          controller: cubit.phoneNumberController,
          labelText: AppLocale.phoneNumber.getString(context),
          focusNode: phoneNumberFocusNode,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.phone,
          validator: (value) {
            if (value.isEmpty || !AppRegex.isPhoneNumberValid(value)) {
              return AppLocale.pleaseEnterAValidPhoneNumber.getString(context);
            }
          },
        ),
        AppTextFormField(
          controller: cubit.unitAreaController,
          labelText: AppLocale.unitArea.getString(context),
          focusNode: unitAreaFocusNode,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.number,
          validator: (value) {
            if (value.isEmpty) {
              return "Please enter your unit area";
            }
          },
        ),
        AppTextFormField(
          controller: cubit.budgetController,
          labelText: AppLocale.budget.getString(context),
          focusNode: budgetFocusNode,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.number,
          validator: (value) {
            if (value.isEmpty) {
              return "Please enter your budget";
            }
          },
        ),
        AppTextFormField(
          controller: cubit.requiredDurationController,
          labelText: AppLocale.durationInDays.getString(context),
          focusNode: requiredDurationFocusNode,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.number,
          validator: (value) {
            if (value.isEmpty) {
              return "Please enter your required duration in days";
            }
          },
        ),
        AppTextFormField(
          controller: cubit.notesController,
          labelText: AppLocale.notes.getString(context),
          keyboardType: TextInputType.multiline,
          textInputAction: TextInputAction.newline,
          decoration: getCommonInputDecoration(
            labelText: AppLocale.notes.getString(context),
          ).copyWith(
            constraints: BoxConstraints(
              maxHeight: 120.h,
            ),
            alignLabelWithHint: true,
            isDense: true,
          ),
          maxLines: 10,
          validator: (value) {
            if (value.isEmpty) {
              return "Please enter your notes";
            }
            return null;
          },
        ),
      ],
    );
  }
}
