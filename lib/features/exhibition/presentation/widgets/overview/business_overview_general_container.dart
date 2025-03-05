import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/theming/app_assets.dart';
import 'package:home4u/core/theming/app_styles.dart';

import '../../../../../core/utils/spacing.dart';
import '../../../../../core/widgets/app_text_form_field.dart';
import '../../../../../core/widgets/get_common_input_decoration.dart';
import '../../../../../locale/app_locale.dart';
import 'business_text_field_prefix_icon.dart';


class BusinessOverviewGeneralContainer extends StatelessWidget {
  const BusinessOverviewGeneralContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 331.h,
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
              AppLocale.general.getString(context),
              style: AppStyles.font24BlackMedium,
            ),
            verticalSpace(24),
            _buildGeneralDataExhibitionName(context),
            verticalSpace(16),
            _buildGeneralDataDescription(context),
          ],
        ),
      ),
    );
  }

  Widget _buildGeneralDataExhibitionName(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8.h,
      children: [
        Text(
          AppLocale.exhibitionName.getString(context),
          style: AppStyles.font16BlackMedium,
        ),
        AppTextFormField(
          labelText: AppLocale.exhibitionName.getString(context),
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          controller: TextEditingController(),
          decoration: getCommonInputDecoration(
            labelText: AppLocale.exhibitionName.getString(context),
            prefixIcon: BusinessTextFieldPrefixIcon(
              svgIcon: AppAssets.exhibitionHouseBuilding,
            ),
          ),
          validator: (value) {
            if (value.isEmpty) {
              return "Please enter your exhibition name";
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildGeneralDataDescription(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8.h,
      children: [
        Text(
          AppLocale.description.getString(context),
          style: AppStyles.font16BlackMedium,
        ),
        AppTextFormField(
          labelText: AppLocale.projectDescription.getString(context),
          keyboardType: TextInputType.multiline,
          textInputAction: TextInputAction.newline,
          controller: TextEditingController(),
          decoration: getCommonInputDecoration(
            labelText: AppLocale.overviewDescription.getString(context),
          ).copyWith(
            constraints: BoxConstraints(
              maxHeight: 100.h,
            ),
            alignLabelWithHint: true,
            isDense: true,
          ),
          maxLines: 10,
          validator: (value) {
            if (value.isEmpty) {
              return "Please enter your project description";
            }
            return null;
          },
        ),
      ],
    );
  }
}
