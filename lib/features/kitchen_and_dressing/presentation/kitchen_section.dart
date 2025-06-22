import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/kitchen_and_dressing/presentation/widgets/kitchen_widgets/kitchen_inputs.dart';

import '../../../core/widgets/app_custom_button.dart';
import '../../../locale/app_locale.dart';
import '../logic/kitchen_and_dressing_cubit.dart';
import '../logic/kitchen_and_dressing_state.dart';

class KitchenSection extends StatelessWidget {
  const KitchenSection({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<KitchenAndDressingCubit>();
    final kitchenFormKey = GlobalKey<FormState>();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: kitchenFormKey,
            child: Column(
              children: [
                KitchenInputs(),
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
                          if (kitchenFormKey.currentState!.validate()) {
                            cubit.sendKitchenData(context);
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
      ),
    );
  }
}
