import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home4u/core/extensions/navigation_extension.dart';
import 'package:home4u/core/routing/routes.dart';
import 'package:home4u/core/theming/app_assets.dart';
import 'package:home4u/core/theming/app_colors.dart';
import 'package:home4u/core/theming/app_styles.dart';
import 'package:home4u/core/widgets/app_custom_button.dart';
import 'package:home4u/core/widgets/app_custom_text_button_with_icon.dart';
import 'package:home4u/features/products/logic/products_cubit.dart';
import 'package:home4u/locale/app_locale.dart';

class SuccessMissionDialog extends StatelessWidget {
  final bool isUpdate;
  const SuccessMissionDialog({super.key,  this.isUpdate = false});

  @override
  Widget build(BuildContext context) {
    final double dialogHeight = MediaQuery.sizeOf(context).height * 0.465;
    final double dialogWidth = MediaQuery.sizeOf(context).width * 0.77;

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Container(
        height: dialogHeight,
        width: dialogWidth,
        padding: EdgeInsets.all(32.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: AppColors.whiteColor,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AppAssets.successMissionSvgImage,
              height: 64.h,
              width: 64.w,
            ),
            SizedBox(height: 32.h),
            Text(
              isUpdate?AppLocale.productUpdatedSuccessfully.getString(context):AppLocale.productUploadedSuccessfully.getString(context),
              style: AppStyles.font24BlackMedium,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32.h),
            _buildButtons(context),
          ],
        ),
      ),
    );
  }

  Widget _buildButtons(BuildContext context) {
    var cubit = context.read<ProductsCubit>();
    return Column(
      children: [
        AppCustomTextButtonWithIcon(
          onPressed: () {},
          isWhiteLoading: false,
          svgIcon: AppAssets.editIconSvg,
          text: AppLocale.edit.getString(context),
          textStyle: AppStyles.font16DarkBlueBold,
          backgroundColor: AppColors.whiteColor,
          svgIconColor: AppColors.secondaryColor,
          useGradient: false,
        ),
        SizedBox(height: 16.h),
        AppCustomButton(
          onPressed: () {

            context.pushNamed(Routes.productsScreen);
            cubit.getProducts();
          },
          textButton: AppLocale.goToProductList.getString(context),
          btnHeight: 50.h,
          btnWidth: MediaQuery.sizeOf(context).width,
        ),
      ],
    );
  }
}
