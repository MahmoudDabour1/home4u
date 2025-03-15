import 'dart:developer';

import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home4u/core/theming/app_assets.dart';
import 'package:home4u/core/theming/app_colors.dart';
import 'package:home4u/core/utils/spacing.dart';
import 'package:home4u/features/exhibition/logic/business_add_product_state.dart';

import '../../../../../core/localization/app_localization_cubit.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/widgets/app_custom_button.dart';
import '../../../../../core/widgets/app_custom_text_button_with_icon.dart';
import '../../../../../core/widgets/app_rounded_back_button.dart';
import '../../../../../locale/app_locale.dart';
import '../../../logic/business_add_product_cubit.dart';
import '../../product_preview_screen.dart';
import 'add_product_basic_details_stepper.dart';
import 'add_product_colors_and_stock.dart';
import 'add_product_images.dart';
import 'add_product_materials_and_specs.dart';
import 'success_mission_dialog.dart';

class AddProductInfoStepper extends StatefulWidget {
  final int? productIndex;

  const AddProductInfoStepper({super.key,  this.productIndex});

  @override
  State<AddProductInfoStepper> createState() => _AddProductInfoStepperState();
}

class _AddProductInfoStepperState extends State<AddProductInfoStepper> {
  int activeStep = 0;
  final int upperBound = 3;

  /// Steps Data
  final List<String> stepTitles = [
    AppLocale.basicDetails,
    AppLocale.materialsSpecs,
    AppLocale.colorsStock,
    AppLocale.uploadImages,
  ];

  final List<String> stepImages = [
    AppAssets.stepperBasicDetailsSvg,
    AppAssets.stepperMaterialsAndSpecsSvg,
    AppAssets.stepperColorsAndStockSvg,
    AppAssets.uploadImageIcon,
  ];

  late final List<Widget> stepPages ;

  /// Move to next step
  void _nextStep() {
    if (activeStep < upperBound) {
      setState(() => activeStep++);
    }
  }

  /// Move to previous step
  void _previousStep() {
    if (activeStep > 0) {
      setState(() => activeStep--);
    }
  }

  void _navigateToPreview() {
    final cubit = context.read<BusinessAddProductCubit>();
    final previewData = cubit.getPreviewData(context);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BlocProvider.value(
          value: cubit,
          child: ProductPreviewScreen(previewData: previewData),
        ),
      ),
    );
  }
@override
  void initState() {
    super.initState();
    stepPages = [
      AddProductBasicDetailsStepper(productIndex:widget.productIndex,),
      AddProductMaterialsAndSpecs(),
      AddProductColorsAndStock(),
      AddProductImages(),
    ];
  }
  @override
  Widget build(BuildContext context) {
    return BlocListener<BusinessAddProductCubit, BusinessAddProductState>(
      listener: (context, state) {
        state.maybeWhen(
          addBusinessProductFailure: (message) {
            log('Product failure because $message');
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Product  failure because $message'),
                backgroundColor: Colors.red,
              ),
            );
          },
          addBusinessProductSuccess: (productResponse) {
            showAdaptiveDialog(
              context: context,
              builder: (context) => SuccessMissionDialog(),
            );
          },
          orElse: () {},
        );
      },
      child: Padding(
        padding: EdgeInsets.only(top: 32.h, left: 24.w, right: 24.w),
        child: Column(
          children: [
            _buildStepper(),
            stepPages[activeStep],
            verticalSpace(32),
            if (activeStep == upperBound) _buildPreviewButton(),
            _buildNavigationButtons(widget.productIndex),
            verticalSpace(32),
          ],
        ),
      ),
    );
  }

  /// Build EasyStepper widget
  Widget _buildStepper() {
    return EasyStepper(
      activeStep: activeStep,
      internalPadding: 16.h,
      lineStyle: const LineStyle(
        lineLength: 50,
        lineType: LineType.normal,
        lineThickness: 3,
        lineSpace: 1,
        lineWidth: 10,
        unreachedLineType: LineType.dashed,
      ),
      stepShape: StepShape.rRectangle,
      stepBorderRadius: 16.r,
      borderThickness: 2,
      padding:
          EdgeInsetsDirectional.symmetric(horizontal: 30.w, vertical: 20.h),
      stepRadius: 28.r,
      finishedStepBorderColor: Color(0xff7F7FB3),
      activeStepBorderColor: Color(0xff2D2D4C),
      finishedStepBackgroundColor: AppColors.whiteColor,
      showLoadingAnimation: false,
      textDirection: context.read<AppLocalizationCubit>().textDirection,
      steps: List.generate(stepTitles.length, (index) {
        return _buildStep(
          title: stepTitles[index].getString(context),
          activeOpacity: activeStep >= index ? 1 : 0.3,
          image: stepImages[index],
        );
      }),
      onStepReached: (index) => setState(() => activeStep = index),
    );
  }

  /// Build single step with image & title
  EasyStep _buildStep({
    required String title,
    required double activeOpacity,
    required String image,
  }) {
    return EasyStep(
      customStep: Opacity(
        opacity: activeOpacity,
        child: Center(
          child: SvgPicture.asset(
            image,
            height: 28.h,
            width: 28.w,
          ),
        ),
      ),
      customTitle: Text(title, textAlign: TextAlign.center),
    );
  }

  /// Build product preview button
  Widget _buildPreviewButton() {
    return Column(
      children: [
        AppCustomTextButtonWithIcon(
          onPressed: () => _navigateToPreview(),
          svgIcon: AppAssets.productPreviewIcon,
          svgIconColor: AppColors.secondaryColor,
          text: AppLocale.productPreview.getString(context),
          backgroundColor: AppColors.whiteColor,
          textStyle: AppStyles.font16DarkBlueBold,
          useGradient: false,
        ),
        verticalSpace(16),
      ],
    );
  }

  /// Build navigation buttons (Previous & Next)
  Widget _buildNavigationButtons(int ? productIndex) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (activeStep > 0) _buildBackButton(),
        if (activeStep > 0) SizedBox(width: 16.w),
        activeStep == upperBound ? _buildSubmitButton(productIndex) : _buildNextButton(),
      ],
    );
  }

  /// Build back button
  /// ToDo : Disable All Buttons When Click on Submit
  /// ToDo : Add Gradient to button [Done]
  Widget _buildBackButton() {
    return AppRoundedBackButton(
      onPressed: _previousStep,
    );
  }

  /// Build submit button
  Widget _buildSubmitButton(int? productIndex) {
    return BlocBuilder<BusinessAddProductCubit, BusinessAddProductState>(
      builder: (context, state) {
        return Expanded(
          child: AppCustomTextButtonWithIcon(
            onPressed: () {
              context.read<BusinessAddProductCubit>().addOrUpdateProduct(
                isUpdate: productIndex !=null ?true:false,
                productId:94,
              );
            },
            isLoading: state is AddBusinessProductLoading,
            svgIcon: AppAssets.submitIconSvg,
            text: AppLocale.submit.getString(context),
            backgroundColor: AppColors.ratingColor,
            useGradient: true,
          ),
        );
      },
    );
  }

  /// Build next button
  Widget _buildNextButton() {
    return Expanded(
      child: AppCustomButton(
        onPressed: _nextStep,
        textButton: AppLocale.nextButton.getString(context),
        btnHeight: 50.h,
        btnWidth: 200.w,
      ),
    );
  }
}
