import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/app_assets.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/widgets/app_custom_text_button_with_icon.dart';
import '../../../../../locale/app_locale.dart';

class ProductSubmitButton extends StatelessWidget {
  const ProductSubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0).w,
      child: AppCustomTextButtonWithIcon(
        svgIcon: AppAssets.submitIconSvg,
        text: AppLocale.submit.getString(context),
        onPressed: () {},
        textStyle: AppStyles.font16DarkBlueBold,
        backgroundColor: AppColors.whiteColor,
        svgIconColor: AppColors.secondaryColor,
        useGradient: false,
      ),
    );
  }
}
