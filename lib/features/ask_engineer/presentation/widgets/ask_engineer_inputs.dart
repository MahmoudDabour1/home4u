import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/spacing.dart';
import '../../../../core/widgets/app_text_form_field.dart';
import '../../../../locale/app_locale.dart';
import '../../logic/ask_engineer_cubit.dart';
import 'ask_engineer_drop_down_buttons.dart';

class AskEngineerInputs extends StatelessWidget {
  const AskEngineerInputs({super.key});

  @override
  Widget build(BuildContext context) {
    final askEngineerCubit = context.read<AskEngineerCubit>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          verticalSpace(32),
          AppTextFormField(
              labelText: AppLocale.projectName.getString(context),
              controller: askEngineerCubit.projectNameController,
              validator: (value) {
                if (value.isEmpty) {
                  return AppLocale.pleaseEnterAProjectName.getString(context);
                }
                return null;
              }),
          verticalSpace(16),
          AppTextFormField(
              labelText: AppLocale.phoneNumber.getString(context),
              controller: askEngineerCubit.phoneNumberController,
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value.isEmpty) {
                  return AppLocale.pleaseEnterAPhoneNumber.getString(context);
                }
                return null;
              }),
          verticalSpace(16),
          AppTextFormField(
              labelText: AppLocale.projectDescription.getString(context),
              controller: askEngineerCubit.projectDescriptionController,
              validator: (value) {
                if (value.isEmpty) {
                  return AppLocale.pleaseEnterAProjectDescription.getString(context);
                }
                return null;
              }),
          verticalSpace(16),
          AppTextFormField(
              labelText: AppLocale.budget.getString(context),
              controller: askEngineerCubit.budgetController,
              validator: (value) {
                if (value.isEmpty) {
                  return AppLocale.pleaseEnterABudget.getString(context);
                }
                return null;
              }),
          AskEngineerDropDownButtons(),
        ],
      ),
    );
  }
}
