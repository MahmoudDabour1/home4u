import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/routing/routes.dart';
import 'package:home4u/core/utils/spacing.dart';
import 'package:home4u/features/auth/login/logic/login_cubit.dart';
import 'package:home4u/features/auth/login/logic/login_state.dart';

import '../../../../../locale/app_locale.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/widgets/app_custom_button.dart';
import '../../../widgets/google_and_facebook_auth_buttons.dart';
import 'dont_have_an_account_text.dart';

class LoginButtons extends StatelessWidget {
  const LoginButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.forgetPasswordScreen);
                },
                child: Text(
                  AppLocale.forgetPassword.getString(context),
                  style: AppStyles.font14DarkBlueBold,
                ),
              ),
            ),
            AppCustomButton(
              textButton: AppLocale.login.getString(context),
              isLoading: state is LoginLoading,
              onPressed: () {
                if (context
                    .read<LoginCubit>()
                    .formKey
                    .currentState!
                    .validate()) {
                  context.read<LoginCubit>().emitLoginStates(context);
                }
              },
              btnHeight: 65.h,
              btnWidth: MediaQuery.sizeOf(context).width,
            ),
            GoogleAndFacebookAuthButtons(
              onPressedFacebook: () {},
              onPressedGoogle: () {},
            ),
            verticalSpace(16),
            DontHaveAnAccountText(),
            verticalSpace(32),
          ],
        );
      },
    );
  }
}
