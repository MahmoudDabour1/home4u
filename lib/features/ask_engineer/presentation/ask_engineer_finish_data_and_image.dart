import 'dart:developer';

import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/widgets/app_custom_button.dart';
import 'package:home4u/core/widgets/app_text_form_field.dart';
import 'package:home4u/core/widgets/select_image_widget.dart';
import 'package:home4u/features/ask_engineer/logic/ask_engineer_cubit.dart';
import 'package:home4u/features/auth/widgets/auth_welcome_data.dart';
import 'package:home4u/locale/app_locale.dart';
import '../../../core/localization/app_localization_cubit.dart';
import '../../../core/theming/app_colors.dart';
import '../../../core/theming/app_styles.dart';
import '../../../core/utils/spacing.dart';
import '../../../core/widgets/app_custom_drop_down_button_form_field.dart';
import '../logic/ask_engineer_state.dart';

class AskEngineerFinishDataAndImage extends StatefulWidget {
  const AskEngineerFinishDataAndImage({super.key});

  @override
  State<AskEngineerFinishDataAndImage> createState() =>
      _AskEngineerFinishDataAndImageState();
}

class _AskEngineerFinishDataAndImageState
    extends State<AskEngineerFinishDataAndImage> {
  final formKey = GlobalKey<FormState>();

  String? urgencyLevel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocBuilder<AskEngineerCubit, AskEngineerState>(
            builder: (context, state) {
              final askEngineerCubit = context.read<AskEngineerCubit>();
              return Form(
                key: formKey,
                child: Column(
                  children: [
                    AuthWelcomeData(
                        headText: AppLocale.engineerTitle, subText: ""),
                    verticalSpace(32),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              _showDatePicker(context, askEngineerCubit);
                            },
                            child: AbsorbPointer(
                              child: AppTextFormField(
                                keyboardType: TextInputType.datetime,
                                controller: askEngineerCubit.projectDeadlineController,
                                labelText: AppLocale.projectDeadline.getString(context),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return  AppLocale.pleaseSelectProjectDeadline
                                        .getString(context);
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          verticalSpace(16),
                          AppCustomDropDownButtonFormField(
                            value: urgencyLevel,
                            items: askEngineerCubit.urgencyLevelList
                                .map((unitType) {
                              return DropdownMenuItem<String>(
                                value: unitType.id.toString(),
                                child: Text(
                                  unitType.name ?? '',
                                  style: AppStyles.font16BlackLight,
                                ),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                urgencyLevel = value;
                                askEngineerCubit.selectUrgencyLevel = value;
                              });
                            },
                            labelText:
                                AppLocale.urgencyLevel.getString(context),
                            validator: (value) {
                              if (value == null) {
                                return AppLocale.pleaseSelectUrgencyLevel
                                    .getString(context);
                              }
                              return null;
                            },
                          ),
                          verticalSpace(16),
                          SelectImageWidget(
                            cubit: askEngineerCubit,
                            images: askEngineerCubit.images,
                            updateImageCallback:
                                askEngineerCubit.updateSelectedImages,
                          ),
                          verticalSpace(16),
                          AppCustomButton(
                            textButton: AppLocale.confirm,
                            btnWidth: MediaQuery.sizeOf(context).width,
                            btnHeight: 56.h,
                            isLoading: state is AskEngineerLoading,
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                askEngineerCubit.askEngineer(context);
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
  void _showDatePicker(BuildContext context, cubit) {
    BottomPicker.date(
      pickerTitle: Text(
         AppLocale.projectDeadline.getString(context),
        style: AppStyles.font20BlackMedium,
      ),
      initialDateTime: DateTime.now(),
      maxDateTime: DateTime.now(),
      minDateTime: DateTime(1980),
      pickerTextStyle: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 16.sp,
      ),
      onChange: (index) {
        log(index);
      },
      onSubmit: (index) {
        String formattedDate =
            "${index.year}-${index.month.toString().padLeft(2, '0')}-${index.day.toString().padLeft(2, '0')}";
          cubit.projectDeadlineController.text = formattedDate;
      },
      bottomPickerTheme: BottomPickerTheme.plumPlate,
      buttonStyle: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(14).r,
        color: AppColors.secondaryGradientColor,
      ),
      buttonContent: Text(
        AppLocale.choose.getString(context),
        style: AppStyles.font16WhiteBold,
        textAlign: TextAlign.center,
      ),
      buttonWidth: MediaQuery.sizeOf(context).width * 0.5,
      titlePadding: EdgeInsets.symmetric(vertical: 8.h),
      layoutOrientation: context.read<AppLocalizationCubit>().textDirection ==
          TextDirection.ltr
          ? TextDirection.ltr
          : TextDirection.rtl,
      closeIconColor: AppColors.blackColor,
      closeIconSize: 28.r,
      buttonPadding: 12.h,
    ).show(context);
  }
}
