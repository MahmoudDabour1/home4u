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
import '../../../../../core/utils/spacing.dart';
import '../../../../../core/widgets/app_custom_button.dart';
import '../../../../../locale/app_locale.dart';
import '../../../widgets/google_and_facebook_auth_buttons.dart';
import 'already_have_an_account.dart';

class SignUpButtons extends StatelessWidget {
  const SignUpButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        final signUpCubit = context.read<SignUpCubit>();

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              _buildSignUpButton(context, state, signUpCubit),
              verticalSpace(16),
              _buildOrContinueWithText(context),
              GoogleAndFacebookAuthButtons(
                onPressedFacebook: () {},
                onPressedGoogle: () {},
              ),
              const AlreadyHaveAnAccount(),
              verticalSpace(32),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSignUpButton(
      BuildContext context, SignUpState state, SignUpCubit signUpCubit) {
    return AppCustomButton(
      isLoading: state is SignUpLoadingState,
      textButton: AppLocale.signUp.getString(context),
      onPressed: () async {
        if (signUpCubit.formKey.currentState!.validate()) {
          await SharedPrefHelper.setData(
              SharedPrefKeys.isFromForgetPassword, false);
          _navigateToSignUpScreen(context, signUpCubit);
        }
      },
      btnHeight: 65.h,
      btnWidth: MediaQuery.sizeOf(context).width,
    );
  }

  void _navigateToSignUpScreen(BuildContext context, SignUpCubit signUpCubit) {
    final userTypeCode = signUpCubit.selectedUserType?.code;
    final userTypeId = signUpCubit.selectedUserType?.id;
    switch (userTypeCode) {
      case "ENGINEER":
        context.pushNamed(Routes.engineerSignUpScreen);
        break;
      case "TECHNICAL_WORKER":
        context.pushNamed(Routes.technicalWorkerSignUpScreen);
        break;
      case "EXHIBITION":
      case "STORE":
        context.read<SignUpCubit>().getBusinessTypes(userTypeId!);
        context.pushNamed(Routes.businessSignUpScreen);
        break;
      default:
        signUpCubit.emitSignUp();
    }
  }

  Widget _buildOrContinueWithText(BuildContext context) {
    return Text(
      AppLocale.orContinueWith.getString(context),
      style: AppStyles.font16DarkBlueBold,
    );
  }
}
