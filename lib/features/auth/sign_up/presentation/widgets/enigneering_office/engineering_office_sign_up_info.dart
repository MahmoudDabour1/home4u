import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/spacing.dart';
import '../../../logic/sign_up_cubit.dart';
import 'engineering_office_drop_down_buttons.dart';
import 'engineering_office_inputs.dart';
import 'engineering_office_sign_up_button.dart';
import 'engineering_office_upload_images.dart';

class EngineeringOfficeSignUpInfo extends StatelessWidget {
  const EngineeringOfficeSignUpInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final signUpCubit = context.read<SignUpCubit>();
    return Padding(
      padding : const EdgeInsets.symmetric(horizontal: 24.0).w,
      child : Column(
        children: [
          EngineeringOfficeInputs(),
          EngineeringOfficeDropDownButtons(),
          EngineeringOfficeUploadImages(),
          verticalSpace(32),
          EngineeringOfficeSignUpButton(
            onPressed: () {
              final checkInputs = signUpCubit.formKey.currentState!.validate();
              if (checkInputs) {
                signUpCubit.emitSignUp();
              }
            },
          ),
          verticalSpace(32),
        ],
      ),
    );
  }
}
