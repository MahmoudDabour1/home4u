import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/helpers/shared_pref_helper.dart';
import 'package:home4u/core/helpers/shared_pref_keys.dart';
import 'package:home4u/features/auth/forget_password/logic/forget_password_cubit.dart';

import '../../../../../core/helpers/app_regex.dart';
import '../../../../../core/utils/spacing.dart';
import '../../../../../core/widgets/app_custom_button.dart';
import '../../../../../core/widgets/app_text_form_field.dart';
import '../../../../../locale/app_locale.dart';
import '../../logic/forget_password_state.dart';

class ForgetPasswordBody extends StatelessWidget {
  const ForgetPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
        builder: (context, state) {
          var cubit = ForgetPasswordCubit.get(context);
          return Form(
            key: cubit.formKey,
            child: Column(
              children: [
                verticalSpace(32),
                AppTextFormField(
                  controller: cubit.emailController,
                  labelText: AppLocale.emailAddress.getString(context),
                  validator: (value) {
                    if (value.isEmpty || !AppRegex.isEmailValid(value)) {
                      return AppLocale.pleaseEnterAValidEmailAddress
                          .getString(context);
                    }
                  },
                  keyboardType: TextInputType.emailAddress,
                ),
                verticalSpace(32),
                AppCustomButton(
                  textButton: AppLocale.send.getString(context),
                  isLoading: state is ForgetPasswordLoading,
                  btnWidth: MediaQuery.sizeOf(context).width,
                  btnHeight: 65.h,
                  onPressed: () async {
                    if (cubit.formKey.currentState!.validate()) {
                      await SharedPrefHelper.setData(
                          SharedPrefKeys.isFromForgetPassword, true);
                      cubit
                          .emitForgetPasswordStates(cubit.emailController.text);
                    }
                  },
                ),
                verticalSpace(32),
              ],
            ),
          );
        },
      ),
    );
  }
}
