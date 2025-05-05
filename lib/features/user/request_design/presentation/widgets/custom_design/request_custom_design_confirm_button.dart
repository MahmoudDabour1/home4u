import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/user/request_design/logic/request_design_cubit.dart';
import 'package:home4u/features/user/request_design/logic/request_design_state.dart';

import '../../../../../../core/widgets/app_custom_button.dart';
import '../../../../../../locale/app_locale.dart';

class RequestCustomDesignConfirmButton extends StatelessWidget {
  const RequestCustomDesignConfirmButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RequestDesignCubit, RequestDesignState>(
      builder: (context, state) {
        final cubit = context.read<RequestDesignCubit>();
        return AppCustomButton(
          isLoading: state is AddRequestDesignLoading,
          textButton: AppLocale.confirm.getString(context),
          btnWidth: MediaQuery.sizeOf(context).width,
          btnHeight: 50.h,
          onPressed: () async {
            if (cubit.formKey.currentState!.validate()) {
              cubit.addRequestDesign(
                requestDesignBody: cubit.getRequestDesignBody(),
              );
            }
          },
        );
      },
    );
  }
}
