import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/localization/app_localization_cubit.dart';
import 'package:home4u/core/theming/app_colors.dart';
import 'package:home4u/core/theming/app_styles.dart';
import 'package:home4u/core/widgets/get_common_input_decoration.dart';
import 'package:home4u/features/profile/logic/project/project_cubit.dart';
import 'package:home4u/features/profile/logic/project/project_state.dart';

import '../../../../../core/utils/spacing.dart';
import '../../../../../core/widgets/app_custom_button.dart';
import '../../../../../core/widgets/app_text_form_field.dart';
import '../../../../../core/widgets/select_image_widget.dart';
import '../../../../../locale/app_locale.dart';

class AddProjectInfo extends StatelessWidget {
  const AddProjectInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectCubit, ProjectState>(
      builder: (context, state) {
        final cubit = ProjectCubit.get(context);
        if (state is ProjectFailureState) {
          return Center(child: Text(state.errorMessage));
        } else {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0).w,
            child: Column(
              children: [
                SelectImageWidget(
                  cubit: cubit,
                  images: cubit.images,
                  isCoverImage: false,
                ),
                verticalSpace(16),
                SelectImageWidget(
                  cubit: cubit,
                  images: [if (cubit.coverImage != null) cubit.coverImage!],
                  isCoverImage: true,
                ),
                verticalSpace(16),
                verticalSpace(16),
                _buildProjectNameField(cubit,context),
                verticalSpace(16),
                _buildProjectDescriptionField(cubit, context),
                verticalSpace(16),
                _buildProjectDatesFields(context, cubit),
                verticalSpace(16),
                _buildProjectToolsField(cubit,context),
                verticalSpace(32),
                _buildSubmitButton(context, state, cubit),
                verticalSpace(64),
              ],
            ),
          );
        }
      },
    );
  }

  Widget _buildProjectNameField(cubit,BuildContext context) {
    return AppTextFormField(
      labelText: AppLocale.projectName.getString(context),
      controller: cubit.projectNameController,
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value.isEmpty) {
          return "Please enter your project name";
        }
        return null;
      },
    );
  }

  Widget _buildProjectDescriptionField(cubit, context) {
    return AppTextFormField(
      labelText: AppLocale.projectDescription,
      keyboardType: TextInputType.multiline,
      textInputAction: TextInputAction.newline,
      controller: cubit.projectDescriptionController,
      decoration: getCommonInputDecoration(
        labelText: AppLocale.projectDescription.getString(context),
      ).copyWith(
        constraints: BoxConstraints(
          maxHeight: 128.h,
        ),
        isDense: true,
      ),
      maxLines: 6,
      validator: (value) {
        if (value.isEmpty) {
          return "Please enter your project description";
        }
        return null;
      },
    );
  }

  Widget _buildProjectDatesFields(BuildContext context, cubit) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              _showDatePicker(context, cubit, isStartDate: true);
            },
            child: AbsorbPointer(
              child: AppTextFormField(
                keyboardType: TextInputType.datetime,
                controller: cubit.projectStartDateController,
                labelText: AppLocale.projectStartData.getString(context),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please enter your start date";
                  }
                  return null;
                },
              ),
            ),
          ),
        ),
        horizontalSpace(16),
        Expanded(
          child: GestureDetector(
            onTap: () {
              _showDatePicker(context, cubit, isStartDate: false);
            },
            child: AbsorbPointer(
              child: AppTextFormField(
                labelText: AppLocale.projectEndData.getString(context),
                keyboardType: TextInputType.datetime,
                controller: cubit.projectEndDateController,
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please enter your end date";
                  }
                  return null;
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _showDatePicker(BuildContext context, cubit,
      {required bool isStartDate}) {
    BottomPicker.date(
      pickerTitle: Text(
        isStartDate
            ? AppLocale.setStartDate.getString(context)
            : AppLocale.setEndDate.getString(context),
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
        print(index);
      },
      onSubmit: (index) {
        String formattedDate =
            "${index.year}-${index.month.toString().padLeft(2, '0')}-${index.day.toString().padLeft(2, '0')}";
        if (isStartDate) {
          cubit.projectStartDateController.text = formattedDate;
        } else {
          cubit.projectEndDateController.text = formattedDate;
        }
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

  Widget _buildProjectToolsField(cubit,BuildContext context) {
    return AppTextFormField(
      labelText: AppLocale.projectTools.getString(context),
      keyboardType: TextInputType.text,
      controller: cubit.projectToolsController,
      validator: (value) {
        if (value.isEmpty) {
          return "Please enter your project location";
        }
        return null;
      },
    );
  }

  Widget _buildSubmitButton(BuildContext context, ProjectState state, cubit) {
    return AppCustomButton(
      isLoading: state is AddProjectLoading,
      textButton: AppLocale.confirm.getString(context),
      btnWidth: MediaQuery.sizeOf(context).width,
      btnHeight: 65.h,
      onPressed: () {
        cubit.addProject(context);
      },
    );
  }
}
