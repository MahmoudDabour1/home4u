import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/app_assets.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/utils/spacing.dart';
import '../../../../../core/widgets/app_text_form_field.dart';
import '../../../../../core/widgets/get_common_input_decoration.dart';
import '../../../../../locale/app_locale.dart';
import 'business_text_field_prefix_icon.dart';

class BusinessOverviewSocialMediaContainer extends StatelessWidget {
  const BusinessOverviewSocialMediaContainer({super.key});

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
              AppLocale.socialMedia.getString(context),
              style: AppStyles.font24BlackMedium,
            ),
            verticalSpace(24),
            _buildFacebookSocialName(context),
            verticalSpace(16),
            _buildInstagramSocialName(context),
            verticalSpace(16),
            _buildWebsiteSocialName(context),
          ],
        ),
      ),
    );
  }

  Widget _buildFacebookSocialName(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8.h,
      children: [
        Text(
          AppLocale.facebook.getString(context),
          style: AppStyles.font16BlackMedium,
        ),
        AppTextFormField(
          labelText: AppLocale.facebook.getString(context),
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          controller: TextEditingController(),
          decoration: getCommonInputDecoration(
            labelText: AppLocale.facebook.getString(context),
            prefixIcon: BusinessTextFieldPrefixIcon(
              svgIcon: AppAssets.facebookIcon,
            ),
          ),
          validator: (value) {
            if (value.isEmpty) {
              return "Please enter your facebook";
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildInstagramSocialName(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8.h,
      children: [
        Text(
          AppLocale.instagram.getString(context),
          style: AppStyles.font16BlackMedium,
        ),
        AppTextFormField(
          labelText: AppLocale.instagram.getString(context),
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          controller: TextEditingController(),
          decoration: getCommonInputDecoration(
            labelText: AppLocale.instagram.getString(context),
            prefixIcon: BusinessTextFieldPrefixIcon(
              svgIcon: AppAssets.instagramIcon,
            ),
          ),
          validator: (value) {
            if (value.isEmpty) {
              return "Please enter your Instagram";
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildWebsiteSocialName(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8.h,
      children: [
        Text(
          AppLocale.website.getString(context),
          style: AppStyles.font16BlackMedium,
        ),
        AppTextFormField(
          labelText: AppLocale.website.getString(context),
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          controller: TextEditingController(),
          decoration: getCommonInputDecoration(
            labelText: AppLocale.website.getString(context),
            prefixIcon: BusinessTextFieldPrefixIcon(
              svgIcon: AppAssets.websiteIcon,
            ),
          ),
          validator: (value) {
            if (value.isEmpty) {
              return "Please enter your website";
            }
            return null;
          },
        ),
      ],
    );
  }
}
