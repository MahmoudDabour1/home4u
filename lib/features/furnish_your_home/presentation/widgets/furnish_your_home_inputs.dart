import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/utils/spacing.dart';
import 'package:home4u/features/furnish_your_home/presentation/widgets/furnish_your_home_drop_down_menu.dart';

import '../../../../core/widgets/app_text_form_field.dart';
import '../../../../locale/app_locale.dart';
import '../../logic/furnish_your_home_cubit.dart';

class FurnishYourHomeInputs extends StatelessWidget {
  const FurnishYourHomeInputs({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<FurnishYourHomeCubit>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          verticalSpace(32),
          AppTextFormField(
              labelText: AppLocale.phoneNumber.getString(context),
              controller: cubit.phoneController,
              validator: (value) {
                if (value.isEmpty) {
                  return AppLocale.pleaseEnterAPhoneNumber.getString(context);
                }
                return null;
              }),
          verticalSpace(16),
          AppTextFormField(
              controller: cubit.budgetController,
              labelText: AppLocale.budget.getString(context),
              validator: (value) {
                if (value.isEmpty) {
                  return AppLocale.pleaseEnterABudget.getString(context);
                }
                return null;
              }),
          FurnishYourHomeDropDownMenu(),
          AppTextFormField(
              controller: cubit.timeFrameDaysController,
              labelText: AppLocale.timeFrameDays.getString(context),
              validator: (value) {
                if (value.isEmpty) {
                  return AppLocale.pleaseEnterTimeFrameDays.getString(context);
                }
                return null;
              }),
          verticalSpace(16),
          AppTextFormField(
              controller: cubit.noteController,
              labelText: AppLocale.notes.getString(context),
              validator: (value) {}),
          verticalSpace(32),
        ],
      ),
    );
  }
}
