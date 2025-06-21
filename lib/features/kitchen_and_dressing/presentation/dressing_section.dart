import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/widgets/app_custom_button.dart';
import 'package:home4u/features/kitchen_and_dressing/logic/kitchen_and_dressing_cubit.dart';
import 'package:home4u/features/kitchen_and_dressing/presentation/widgets/dressing_widgets/dressing_inputs.dart';
import 'package:home4u/locale/app_locale.dart';

import '../logic/kitchen_and_dressing_state.dart';

class DressingSection extends StatelessWidget {
  const DressingSection({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> dressingFormKey = GlobalKey<FormState>();
    final cubit = context.read<KitchenAndDressingCubit>();
    return Scaffold(
      body: Form(
        key: dressingFormKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              DressingInputs(),
              BlocBuilder<KitchenAndDressingCubit, KitchenAndDressingState>(
                builder: (context, state) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: AppCustomButton(
                      textButton: AppLocale.confirm.getString(context),
                      btnWidth: MediaQuery.sizeOf(context).width,
                      isLoading: state is KitchenAndDressingLoading,
                      btnHeight: 60.h,
                      onPressed: () {
                        if (dressingFormKey.currentState!.validate()) {
                          cubit.sendDressingData(context);
                        }
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
