import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/widgets/app_custom_button.dart';
import 'package:home4u/features/onboarding/presentation/widgets/next_button.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_styles.dart';
import '../../../../core/utils/spacing.dart';
import '../../../../locale/app_locale.dart';
import '../../data/model/onboarding_model.dart';
import 'indicator_widget.dart';

class OnboardingScrollItems extends StatelessWidget {
  final int index;
  final bool isOut;
  final VoidCallback onPressedToSignUp;
  final VoidCallback onPressedToLogin;
  final VoidCallback onSkipPressed;
  final VoidCallback onNextPressed;

  const OnboardingScrollItems({
    super.key,
    required this.index,
    required this.isOut,
    required this.onPressedToSignUp,
    required this.onSkipPressed,
    required this.onNextPressed,
    required this.onPressedToLogin,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0.w),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _buildSkipButton(context),
            _buildImageWithIndicator(),
            verticalSpace(32),
            _buildTitle(context),
            index > 2
                ? SizedBox.shrink()
                : Column(
                    children: [
                      verticalSpace(16),
                      _buildDescription(context),
                    ],
                  ),
            verticalSpace(32),
            _buildButtons(context),
            verticalSpace(32),
          ],
        ),
      ),
    );
  }

  GestureDetector _buildSkipButton(BuildContext context) {
    return GestureDetector(
      onTap: onSkipPressed,
      child: Align(
        alignment: Alignment.topRight,
        child: Text(
          AppLocale.skipButton.getString(context),
          style: AppStyles.font24BlackMedium,
        ),
      ),
    );
  }

  Widget _buildImageWithIndicator() {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        AnimatedScale(
          scale: isOut ? 0 : 1,
          curve: Curves.easeInOut,
          duration: Duration(milliseconds: 200),
          child: Image.asset(
            onBoardingItems[index].image,
            fit: BoxFit.contain,
            width: 345.w,
            height: 315.h,
          ),
        ),
        Positioned(
          bottom: 14.h,
          top: 293.h,
          child: IndicatorWidget(index: index),
        ),
      ],
    );
  }

  Widget _buildTitle(BuildContext context) {
    return AnimatedOpacity(
      opacity: isOut ? 0 : 1,
      duration: Duration(milliseconds: 200),
      child: AutoSizeText(
        textAlign: TextAlign.center,
        onBoardingItems[index].title.getString(context),
        maxLines: 1,
        style: AppStyles.font20BlackMedium,
      ),
    );
  }

  Widget _buildDescription(BuildContext context) {
    return onBoardingItems[index].description.isEmpty
        ? SizedBox.shrink()
        : AnimatedOpacity(
            opacity: isOut ? 0 : 1,
            duration: Duration(milliseconds: 200),
            child: AutoSizeText(
              textAlign: TextAlign.center,
              onBoardingItems[index].description.getString(context),
              maxLines: 5,
              style: AppStyles.font16BlackLight.copyWith(
                height: 1.5,
              ),
            ),
          );
  }

  Widget _buildButtons(BuildContext context) {
    return index == 3
        ? Column(
            children: [
              AppCustomButton(
                textButton: AppLocale.signUp.getString(context),
                btnWidth: MediaQuery.sizeOf(context).width,
                btnHeight: 56.h,
                onPressed: onPressedToSignUp,
              ),
              verticalSpace(16),
              TextButton(
                style: ButtonStyle(
                  fixedSize: WidgetStateProperty.all<Size>(
                    Size(MediaQuery.sizeOf(context).width, 56.h),
                  ),
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0).r,
                      side: BorderSide(
                        color: AppColors.primaryColor,
                        width: 1,
                      ),
                    ),
                  ),
                ),
                onPressed: onPressedToLogin,
                child: Text(
                  AppLocale.login.getString(context),
                  style: AppStyles.font16WhiteBold.copyWith(
                    color: AppColors.blackColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          )
        : NextButton(onPressed: onNextPressed);
  }
}
