import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/theming/app_strings.dart';
import 'package:home4u/core/widgets/app_custom_button.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_styles.dart';
import '../../../../core/utils/spacing.dart';
import '../../data/model/onboarding_model.dart';
import 'indicator_widget.dart';

class OnboardingScrollItems extends StatelessWidget {
  final int index;
  final bool isOut;
  final VoidCallback onStartPressed;
  final VoidCallback onSkipPressed;
  final VoidCallback onNextPressed;

  const OnboardingScrollItems({
    super.key,
    required this.index,
    required this.isOut,
    required this.onStartPressed,
    required this.onSkipPressed,
    required this.onNextPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 24.0.w, left: 24.0.w),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _buildImageWithIndicator(),
            verticalSpace(32),
            _buildTitle(),
            verticalSpace(16),
            _buildDescription(),
            verticalSpace(32),
            _buildButtons(context),
          ],
        ),
      ),
    );
  }

  Widget _buildImageWithIndicator() {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SizedBox(
          width: 345.w,
          height: 315.h,
          child: AnimatedScale(
            scale: isOut ? 0 : 1,
            curve: Curves.easeInOut,
            duration: Duration(milliseconds: 200),
            child: Image.asset(
              onBoardingItems[index].image,
              fit: BoxFit.contain,
            ),
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

  Widget _buildTitle() {
    return AnimatedOpacity(
      opacity: isOut ? 0 : 1,
      duration: Duration(milliseconds: 200),
      child: AutoSizeText(
        textAlign: TextAlign.center,
        onBoardingItems[index].title,
        maxLines: 1,
        style: AppStyles.font20BlackMedium,
      ),
    );
  }

  Widget _buildDescription() {
    return AnimatedOpacity(
      opacity: isOut ? 0 : 1,
      duration: Duration(milliseconds: 200),
      child: AutoSizeText(
        textAlign: TextAlign.center,
        onBoardingItems[index].description,
        maxLines: 5,
        style: AppStyles.font16BlackLight.copyWith(
          height: 1.5,
        ),
      ),
    );
  }

  Widget _buildButtons(BuildContext context) {
    return index == 0
        ? AppCustomButton(
          textButton: AppStrings.startButton,
          btnWidth: MediaQuery.sizeOf(context).width,
          btnHeight: 56.h,
          onPressed: onStartPressed,
        )
        : Row(
            children: [
              Expanded(
                child: Container(
                  color: AppColors.whiteColor,
                  child: TextButton(
                    style: ButtonStyle(
                      fixedSize: WidgetStateProperty.all<Size>(
                        Size(164.w, 56.h),
                      ),
                    ),
                    onPressed: onSkipPressed,
                    child: Text(
                      AppStrings.skipButton,
                      style: AppStyles.font16WhiteBold.copyWith(
                        color: AppColors.blackColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              horizontalSpace(16),
              Expanded(
                child: AppCustomButton(
                  textButton: AppStrings.nextButton,
                  btnWidth: 164.w,
                  btnHeight: 56.h,
                  onPressed: onNextPressed,
                ),
              ),
            ],
          );
  }
}
