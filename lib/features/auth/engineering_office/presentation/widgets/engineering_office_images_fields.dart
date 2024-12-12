import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home4u/core/theming/app_assets.dart';
import 'package:home4u/core/theming/app_strings.dart';
import 'package:home4u/core/utils/spacing.dart';
import 'package:home4u/core/widgets/app_text_form_field.dart';

class EngineeringOfficeImagesFields extends StatelessWidget {
  const EngineeringOfficeImagesFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextFormField(
          labelText: AppStrings.commercialRegister,
          validator: (value) {
            if (value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
          suffixIcon: SizedBox(
            width: 24.w,
            height: 20.h,
            child: Align(
              child: SvgPicture.asset(
                AppAssets.loadImageSvgImage,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        verticalSpace(16),
        AppTextFormField(
          labelText: AppStrings.taxCard,
          validator: (value) {
            if (value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
          suffixIcon: SizedBox(
            width: 24.w,
            height: 20.h,
            child: Align(
              child: SvgPicture.asset(
                AppAssets.loadImageSvgImage,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        verticalSpace(16),
        AppTextFormField(
          labelText: AppStrings.personalCard,
          validator: (value) {
            if (value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
          suffixIcon: SizedBox(
            width: 24.w,
            height: 20.h,
            child: Align(
              child: SvgPicture.asset(
                AppAssets.loadImageSvgImage,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        verticalSpace(16),
        AppTextFormField(
          labelText: AppStrings.coverPhoto,
          validator: (value) {
            if (value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
          suffixIcon: SizedBox(
            width: 24.w,
            height: 20.h,
            child: Align(
              child: SvgPicture.asset(
                AppAssets.loadImageSvgImage,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
