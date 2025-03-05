import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/theming/app_assets.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/utils/spacing.dart';
import '../../../../../locale/app_locale.dart';

class ProductSubmitButton extends StatelessWidget {
  const ProductSubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0).w,
      child: IconButton(
        onPressed: (){},
        icon: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 8.w,
          children: [
            SvgPicture.asset(
              AppAssets.submitIconSvg,
              width: 24.w,
              height: 24.h,
            ),
            Flexible(
              child: Text(
                AppLocale.submit.getString(context),
                style: AppStyles.font16DarkBlueBold,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        style: ButtonStyle(
          padding: WidgetStateProperty.all(EdgeInsets.symmetric(vertical: 16.h)),
          backgroundColor: WidgetStateProperty.all(AppColors.whiteColor),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.r),
              side: BorderSide(
                color: AppColors.secondaryColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
