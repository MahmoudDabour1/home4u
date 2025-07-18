import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/auth/verification/logic/verification_cubit.dart';

import '../../../../../core/widgets/app_custom_button.dart';
import '../../../../../locale/app_locale.dart';
import '../../logic/verification_state.dart';

class VerificationButton extends StatelessWidget {
  const VerificationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0.w),
      child: BlocBuilder<VerificationCubit, VerificationState>(
        builder: (context, state) {
          var cubit = VerificationCubit.get(context);
          return AppCustomButton(
            isLoading: state is VerificationLoading,
            textButton: AppLocale.continue0.getString(context),
            onPressed: () {
              if (cubit.otpValve?.length == 5) {
                cubit.emitVerificationStates();
              }
            },
            btnHeight: 65.h,
            btnWidth: MediaQuery.sizeOf(context).width,
          );
        },
      ),
    );
  }
}
