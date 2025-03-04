import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_assets.dart';
import '../../../../core/theming/app_styles.dart';
import '../../../../core/utils/spacing.dart';
import '../../../../core/widgets/app_text_form_field.dart';
import '../../../../core/widgets/get_common_input_decoration.dart';
import '../../../../locale/app_locale.dart';
import 'business_text_field_prefix_icon.dart';

class BusinessOverviewContactInformationContainer extends StatelessWidget {
  const BusinessOverviewContactInformationContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400.h,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0).h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocale.contactInformation.getString(context),
              style: AppStyles.font24BlackMedium,
            ),
            verticalSpace(24),
            _buildEmailAddressContactInfo(context),
            verticalSpace(16),
            _buildAddressContactInfo(context),
            verticalSpace(16),
            _buildPhoneNumberContactInfo(context),
          ],
        ),
      ),
    );
  }

  Widget _buildEmailAddressContactInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8.h,
      children: [
        Text(
          AppLocale.emailAddress.getString(context),
          style: AppStyles.font16BlackMedium,
        ),
        AppTextFormField(
          labelText: AppLocale.emailAddress.getString(context),
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          controller: TextEditingController(),
          decoration: getCommonInputDecoration(
            labelText: AppLocale.emailAddress.getString(context),
            prefixIcon: BusinessTextFieldPrefixIcon(
              svgIcon: AppAssets.phoneMessageContactIcon,
            ),
          ),
          validator: (value) {
            if (value.isEmpty) {
              return "Please enter your email address";
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildAddressContactInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8.h,
      children: [
        Text(
          AppLocale.address.getString(context),
          style: AppStyles.font16BlackMedium,
        ),
        AppTextFormField(
          labelText: AppLocale.address.getString(context),
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          controller: TextEditingController(),
          decoration: getCommonInputDecoration(
            labelText: AppLocale.address.getString(context),
            prefixIcon: BusinessTextFieldPrefixIcon(
              svgIcon: AppAssets.locationIcon,
            ),
          ),
          validator: (value) {
            if (value.isEmpty) {
              return "Please enter your address";
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildPhoneNumberContactInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8.h,
      children: [
        Text(
          AppLocale.phoneNumber.getString(context),
          style: AppStyles.font16BlackMedium,
        ),
        AppTextFormField(
          labelText: AppLocale.phoneNumber.getString(context),
          keyboardType: TextInputType.phone,
          textInputAction: TextInputAction.next,
          controller: TextEditingController(),
          decoration: getCommonInputDecoration(
            labelText: AppLocale.phoneNumber.getString(context),
            prefixIcon: BusinessTextFieldPrefixIcon(
              svgIcon: AppAssets.phoneCallIcon,
            ),
          ),
          validator: (value) {
            if (value.isEmpty) {
              return "Please enter your address";
            }
            return null;
          },
        ),
      ],
    );
  }
}
