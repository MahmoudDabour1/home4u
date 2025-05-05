import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/utils/spacing.dart';
import 'package:home4u/features/user/request_design/presentation/widgets/custom_design/request_custom_design_inputs.dart';

import '../../logic/request_design_cubit.dart';
import 'custom_design/request_custom_design_confirm_button.dart';
import 'custom_design/request_custom_design_drop_downs.dart';

class RequestDesignCustomBody extends StatelessWidget {
  const RequestDesignCustomBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: context.read<RequestDesignCubit>().formKey,
        child: Column(
          spacing: 16.h,
          children: [
            RequestCustomDesignDropDowns(),
            RequestCustomDesignInputs(),
            verticalSpace(16),
            RequestCustomDesignConfirmButton(),
          ],
        ),
      ),
    );
  }
}
