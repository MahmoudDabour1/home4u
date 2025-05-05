import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/extensions/navigation_extension.dart';
import 'package:home4u/core/routing/routes.dart';
import 'package:home4u/core/theming/app_assets.dart';
import 'package:home4u/core/theming/app_styles.dart';
import 'package:home4u/core/utils/spacing.dart';
import 'package:home4u/core/widgets/app_custom_button.dart';
import 'package:home4u/features/user/renovate_your_house/logic/renovate_your_house_cubit.dart';
import 'package:home4u/features/user/renovate_your_house/presentation/widgets/renovate_your_house_first_info_drop_downs.dart';
import 'package:home4u/locale/app_locale.dart';

import '../../../../core/helpers/app_regex.dart';
import '../../../../core/widgets/app_text_form_field.dart';
import '../../../auth/widgets/auth_welcome_data.dart';

class RenovateYourHouseFirstScreen extends StatelessWidget {
  const RenovateYourHouseFirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RenovateYourHouseCubit>();
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: cubit.validationKey,
            child: Column(
              children: [
                AuthWelcomeData(
                  headText: AppLocale.renovateYourHouse.getString(context),
                  subText: '',
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 24.w,
                    right: 24.w,
                    top: 32.h,
                  ),
                  child: Column(
                    children: [
                      Image.asset(
                        AppAssets.renovateYourHouseImage,
                        fit: BoxFit.cover,
                      ),
                      verticalSpace(32),
                      Text(
                        AppLocale.renovateYourHouseDescription
                            .getString(context),
                        textAlign: TextAlign.center,
                        style: AppStyles.font16BlackLight,
                      ),
                      verticalSpace(32),
                      _buildPhoneTextFormField(context),
                      verticalSpace(16),
                      RenovateYourHouseFirstInfoDropDowns(),
                      verticalSpace(32),
                      AppCustomButton(
                        textButton: AppLocale.nextButton.getString(context),
                        btnWidth: MediaQuery.sizeOf(context).width,
                        btnHeight: 50.h,
                        onPressed: () {
                          if (cubit.validationKey.currentState!.validate()) {
                            context.pushNamed(
                              Routes.renovateYourHouseSecondScreen,
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppTextFormField _buildPhoneTextFormField(BuildContext context) {
    return AppTextFormField(
      controller: context.read<RenovateYourHouseCubit>().phoneNumberController,
      labelText: AppLocale.phoneNumber.getString(context),
      focusNode: context.read<RenovateYourHouseCubit>().phoneNumberFocusNode,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.phone,
      validator: (value) {
        if (value.isEmpty || !AppRegex.isPhoneNumberValid(value)) {
          return AppLocale.pleaseEnterAValidPhoneNumber.getString(context);
        }
      },
    );
  }
}
