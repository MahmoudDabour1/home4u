import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/furnish_your_home/logic/furnish_your_home_cubit.dart';
import 'package:home4u/features/furnish_your_home/presentation/widgets/furnish_your_home_inputs.dart';
import 'package:home4u/features/products/logic/products_cubit.dart';

import '../../../core/widgets/app_custom_button.dart';
import '../../../locale/app_locale.dart';
import '../../auth/widgets/auth_welcome_data.dart';
import '../logic/furnish_your_home_state.dart';

class FurnishYourHomeScreen extends StatefulWidget {
  const FurnishYourHomeScreen({super.key});

  @override
  State<FurnishYourHomeScreen> createState() => _FurnishYourHomeScreenState();
}

class _FurnishYourHomeScreenState extends State<FurnishYourHomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProductsCubit>().getBusinessConfig();
  }

  final furnishYourHomeFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: furnishYourHomeFormKey,
          child: Column(
            children: [
              AuthWelcomeData(
                headText: AppLocale.furnishYourHome.getString(context),
                subText: "",
              ),
              FurnishYourHomeInputs(),
              BlocBuilder<FurnishYourHomeCubit, FurnishYourHomeState>(
                builder: (context, state) {
                  final cubit = context.read<FurnishYourHomeCubit>();
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: AppCustomButton(
                      textButton: AppLocale.confirm.getString(context),
                      btnWidth: MediaQuery.sizeOf(context).width,
                      btnHeight: 60.h,
                      isLoading: state is FurnishYourHomeRequestLoading,
                      onPressed: () {
                        if (furnishYourHomeFormKey.currentState!.validate()) {
                          cubit.sendFurnishYourHome(context);
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
