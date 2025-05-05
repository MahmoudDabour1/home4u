import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/extensions/navigation_extension.dart';
import 'package:home4u/features/ask_technical_worker/logic/ask_technical_cubit.dart';
import 'package:home4u/features/ask_technical_worker/presentation/widgets/ask_technical_inputs.dart';
import 'package:home4u/features/auth/widgets/auth_welcome_data.dart';
import 'package:home4u/locale/app_locale.dart';

import '../../../core/routing/routes.dart';
import '../../../core/utils/spacing.dart';
import '../../../core/widgets/app_custom_button.dart';

class AskTechnicalWorkerScreen extends StatefulWidget {
  const AskTechnicalWorkerScreen({super.key});

  @override
  State<AskTechnicalWorkerScreen> createState() => _AskTechnicalWorkerScreenState();
}

class _AskTechnicalWorkerScreenState extends State<AskTechnicalWorkerScreen> {
  final formKey = GlobalKey<FormState>();
@override
  void initState() {
    super.initState();
    context.read<AskTechnicalCubit>().getAskTechnicalIkp();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                AuthWelcomeData(headText: AppLocale.askTechnical, subText: ""),
                AskTechnicalInputs(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: AppCustomButton(
                    textButton: AppLocale.theNext.getString(context),
                    btnWidth: MediaQuery.sizeOf(context).width,
                    btnHeight: 56.h,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        context.pushNamed(
                          Routes.askTechnicalFinishAndImage,
                        );
                      }
                    },
                  ),
                ),
                verticalSpace(32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
