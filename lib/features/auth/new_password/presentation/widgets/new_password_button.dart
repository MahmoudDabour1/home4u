import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/auth/new_password/logic/new_password_cubit.dart';

import '../../../../../core/theming/app_strings.dart';
import '../../../../../core/widgets/app_custom_button.dart';
import '../../logic/new_password_state.dart';

class NewPasswordButton extends StatelessWidget {
  const NewPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: BlocBuilder<NewPasswordCubit, NewPasswordState>(
        builder: (context, state) {
          var cubit = NewPasswordCubit.get(context);
          return AppCustomButton(
            isLoading: state is NewPasswordLoading,
            textButton: AppStrings.confirm,
            btnWidth: MediaQuery.sizeOf(context).width,
            btnHeight: 65.h,
            onPressed: () {
              if (cubit.formKey.currentState!.validate()) {
                cubit.emitNewPasswordStates();
              }
            },
          );
        },
      ),
    );
  }
}
