import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/extensions/navigation_extension.dart';
import 'package:home4u/core/theming/app_styles.dart';
import 'package:home4u/features/auth/sign_up/logic/sign_up_cubit.dart';
import 'package:home4u/features/auth/sign_up/logic/sign_up_state.dart';

import '../../../../../core/helpers/shared_pref_helper.dart';
import '../../../../../core/helpers/shared_pref_keys.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../locale/app_locale.dart';
import '../../../../../core/utils/spacing.dart';
import '../../../../../core/widgets/app_custom_button.dart';
import '../../../widgets/google_and_facebook_auth_buttons.dart';
import 'already_have_an_account.dart';

class SignUpButtons extends StatelessWidget {
  const SignUpButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              AppCustomButton(
                isLoading: state is SignUpLoadingState,
                textButton: AppLocale.signUp.getString(context),
                onPressed: () async {
                  final checkInputs = context
                      .read<SignUpCubit>()
                      .formKey
                      .currentState!
                      .validate();
                  final signUpCubit = context.read<SignUpCubit>();
                  await SharedPrefHelper.setData(
                      SharedPrefKeys.isFromForgetPassword, false);
                  ///ToDo : refactor this code
                  if (checkInputs) {
                    if (signUpCubit.selectedUserType?.code == "ENGINEER") {
                      context.pushNamed(Routes.engineerSignUpScreen);
                    } else if (signUpCubit.selectedUserType?.code ==
                        "TECHNICAL_WORKER") {
                      context.pushNamed(Routes.technicalWorkerSignUpScreen);
                    } else if(signUpCubit.selectedUserType?.code ==
                        "EXHIBITION" || signUpCubit.selectedUserType?.code == "STORE") {
                      context.pushNamed(Routes.businessSignUpScreen);
                    } else {
                      signUpCubit.emitSignUp();
                    }
                  }
                },
                btnHeight: 65.h,
                btnWidth: MediaQuery.sizeOf(context).width,
              ),
              verticalSpace(16),
              Text(
                AppLocale.orContinueWith.getString(context),
                style: AppStyles.font16DarkBlueBold,
              ),
              GoogleAndFacebookAuthButtons(
                onPressedFacebook: () {},
                onPressedGoogle: () {},
              ),
              AlreadyHaveAnAccount(),
              verticalSpace(32),
            ],
          ),
        );
      },
    );
  }
}
