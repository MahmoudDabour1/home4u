import 'package:flutter/cupertino.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/ask_technical_worker/logic/ask_technical_cubit.dart';

import '../../../../core/utils/spacing.dart';
import '../../../../core/widgets/app_text_form_field.dart';
import '../../../../locale/app_locale.dart';
import 'ask_technical_drop_down_buttons.dart';

class AskTechnicalInputs extends StatelessWidget {
  const AskTechnicalInputs({super.key});

  @override
  Widget build(BuildContext context) {
     final askTechnicalCubit = AskTechnicalCubit.get(context);
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          verticalSpace(32),
          AppTextFormField(
              labelText: AppLocale.projectName.getString(context),
              controller: askTechnicalCubit.projectNameController,
              validator: (value) {
                if (value.isEmpty) {
                  return AppLocale.pleaseEnterAProjectName.getString(context);
                }
                return null;
              }),
          verticalSpace(16),
          AppTextFormField(
              labelText: AppLocale.phoneNumber.getString(context),
              controller: askTechnicalCubit.phoneNumberController,
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
              controller: askTechnicalCubit.projectDescriptionController,
              validator: (value) {
                if (value.isEmpty) {
                  return AppLocale.pleaseEnterAProjectDescription.getString(context);
                }
                return null;
              }),
          verticalSpace(16),
          AppTextFormField(
              labelText: AppLocale.budget.getString(context),
              controller: askTechnicalCubit.budgetController,
              validator: (value) {
                if (value.isEmpty) {
                  return AppLocale.pleaseEnterABudget.getString(context);
                }
                return null;
              }),
          AskTechnicalDropDownButtons(),
        ],
      ),
    );
  }
}
