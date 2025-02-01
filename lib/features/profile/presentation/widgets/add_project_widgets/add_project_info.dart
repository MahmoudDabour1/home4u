import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
                _buildProjectNameField(cubit),
                verticalSpace(16),
                _buildProjectDescriptionField(cubit, context),
                verticalSpace(16),
                _buildProjectDatesFields(cubit),
                verticalSpace(16),
                _buildProjectToolsField(cubit),
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

  Widget _buildProjectNameField(cubit) {
    return AppTextFormField(
      labelText: "Project Name",
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

  Widget _buildProjectDatesFields(cubit) {
    return Row(
      children: [
        Expanded(
          child: AppTextFormField(
            keyboardType: TextInputType.datetime,
            controller: cubit.projectStartDateController,
            labelText: AppLocale.projectStartData,
            validator: (value) {
              if (value.isEmpty) {
                return "Please enter your start date";
              }
              return null;
            },
          ),
        ),
        horizontalSpace(16),
        Expanded(
          child: AppTextFormField(
            labelText: AppLocale.projectEndData,
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
      ],
    );
  }

  Widget _buildProjectToolsField(cubit) {
    return AppTextFormField(
      labelText: AppLocale.projectTools,
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
      textButton: AppLocale.confirm,
      btnWidth: MediaQuery.sizeOf(context).width,
      btnHeight: 65.h,
      onPressed: () {
        cubit.addProject(context);
      },
    );
  }
}
