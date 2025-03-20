import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/auth/login/logic/login_cubit.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/utils/spacing.dart';
import '../../../../../core/widgets/app_text_form_field.dart';
import '../../../../../locale/app_locale.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  bool isObscureText = true;
  final phoneFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context
          .read<LoginCubit>()
          .formKey,
      child: Column(
        children: [
          AppTextFormField(
            controller: context
                .read<LoginCubit>()
                .emailOrPhoneController,
            labelText: AppLocale.emailAddress.getString(context),
            keyboardType: TextInputType.emailAddress,
            focusNode: phoneFocusNode,
            textInputAction: TextInputAction.next,
            validator: (value) {
              if (value.isEmpty
              // ||
                  // !AppRegex.isEmailValid(value)
              ) {
                return AppLocale.pleaseEnterAValidEmailAddress
                    .getString(context);
              }
            },
          ),
          verticalSpace(16),
          AppTextFormField(
            labelText: AppLocale.password.getString(context),
            controller: context
                .read<LoginCubit>()
                .passwordController,
            focusNode: passwordFocusNode,
            textInputAction: TextInputAction.done,
            isObscureText: isObscureText,
            keyboardType: TextInputType.visiblePassword,
            validator: (value) {
              if (value.isEmpty || value.length < 8) {
                return AppLocale.pleaseEnterAValidPassword.getString(context);
              }
            },
            prefixIcon: Icon(
              Icons.lock_open_outlined,
              size: 18.r,
              color: AppColors.iconsColor,
            ),
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscureText = !isObscureText;
                });
              },
              child: Icon(
                isObscureText
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                color: AppColors.iconsColor,
                size: 24.r,
              ),
            ),
          )
        ],
      ),
    );
  }
}
