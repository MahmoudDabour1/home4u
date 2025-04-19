import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/extensions/navigation_extension.dart';
import 'package:home4u/core/routing/routes.dart';
import 'package:home4u/core/utils/spacing.dart';
import 'package:home4u/core/widgets/app_custom_button.dart';
import 'package:home4u/features/ask_engineer/logic/ask_engineer_cubit.dart';
import 'package:home4u/features/ask_engineer/presentation/widgets/ask_engineer_inputs.dart';
import 'package:home4u/features/auth/widgets/auth_welcome_data.dart';

import '../../../locale/app_locale.dart';

class AskEngineerScreen extends StatefulWidget {
  const AskEngineerScreen({super.key});

  @override
  State<AskEngineerScreen> createState() => _AskEngineerScreenState();
}

class _AskEngineerScreenState extends State<AskEngineerScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    context.read<AskEngineerCubit>().getAskEngineerIkp();
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
                AuthWelcomeData(
                    headText: AppLocale.engineerTitle.getString(context),
                    subText: ""),
                AskEngineerInputs(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: AppCustomButton(
                    textButton: AppLocale.theNext.getString(context),
                    btnWidth: MediaQuery.sizeOf(context).width,
                    btnHeight: 56.h,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        context.pushNamed(
                          Routes.askEngineerFinishDataAndImage,
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
