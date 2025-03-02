import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/onboarding/presentation/widgets/next_button.dart';

import '../../../../core/theming/app_styles.dart';
import '../../../../core/utils/spacing.dart';
import '../../../../locale/app_locale.dart';
import '../../data/model/onboarding_model.dart';
import 'auth_continue_buttons.dart';
import 'indicator_widget.dart';

class OnboardingScrollItems extends StatelessWidget {
  final int index;
  final VoidCallback onPressedToSignUp;
  final VoidCallback onPressedToLogin;
  final VoidCallback onSkipPressed;
  final VoidCallback onNextPressed;

  const OnboardingScrollItems({
    super.key,
    required this.index,
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

  Widget _buildSkipButton(BuildContext context) {
    return index != 3
        ? GestureDetector(
            onTap: onSkipPressed,
            child: Align(
              alignment: Alignment.topRight,
              child: Text(
                AppLocale.skipButton.getString(context),
                style: AppStyles.font24BlackMedium,
              ),
            ),
          )
        : SizedBox(height: 34.h);
  }

  Widget _buildImageWithIndicator() {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Image.asset(
          onBoardingItems[index].image,
          fit: BoxFit.contain,
          width: 345.w,
          height: 315.h,
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
    return AutoSizeText(
      textAlign: TextAlign.center,
      onBoardingItems[index].title.getString(context),
      maxLines: 1,
      style: AppStyles.font20BlackMedium,
    );
  }

  Widget _buildDescription(BuildContext context) {
    return onBoardingItems[index].description.isEmpty
        ? SizedBox.shrink()
        : AutoSizeText(
            textAlign: TextAlign.center,
            onBoardingItems[index].description.getString(context),
            maxLines: 5,
            style: AppStyles.font16BlackLight.copyWith(
              height: 1.5,
            ),
          );
  }

  Widget _buildButtons(BuildContext context) {
    return index == 3
        ? AuthContinueButtons(
            onPressedToLogin: onPressedToLogin,
            onPressedToSignUp: onPressedToSignUp,
          )
        : NextButton(onPressed: onNextPressed);
  }
}
