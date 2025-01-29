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
                // verticalSpace(32),
                // _buildImagePickerField(context,cubit),
                // verticalSpace(16),
                // _buildSelectedImagesList(cubit),
                // verticalSpace(16),
                // _buildCoverImagePickerField(),
                // verticalSpace(16),
                // _buildCoverImagePreview(),
                SelectImageWidget(cubit: cubit, image: cubit.images),
                verticalSpace(16),
                SelectImageWidget(
                  cubit: cubit,
                  image: cubit.coverImage,
                  isCoverImage: true,
                ),
                verticalSpace(16),

                // SelectImageWidget(cubit: cubit, image: cubit.coverImage),
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

  // Widget _buildImagePickerField(BuildContext context) {
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
        // final cubit = context.read<ProjectCubit>();
        // DioFactory.setContentType('multipart/form-data');
        //
        // final formData = FormData.fromMap({
        //   "cover": _coverImageMultipart,
        //   "images": _selectedImagesMultipart,
        //   "projectData": jsonEncode({
        //     "name": projectNameController.text,
        //     "description": projectDescriptionController.text,
        //     "startDate": projectStartDateController.text,
        //     "endDate": projectEndDateController.text,
        //     "tools": projectToolsController.text,
        //   }),
        // });
        // final logger = Logger();
        // // Debug print to check the FormData
        // logger.w("FormData: ${formData.fields}");
        // logger.w("Cover Image: ${_coverImageMultipart?.filename}");
        // logger.w(
        //     "Images: ${_selectedImagesMultipart.map((file) => file.filename).toList()}");

        cubit.addProject();
      },
    );
  }
}

// class FullScreenImage extends StatelessWidget {
//   final File imageFile;
//
//   const FullScreenImage({super.key, required this.imageFile});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Center(
//         child: Image.file(imageFile),
//       ),
//     );
//   }
// }
//
// MediaType getContentType(File file) {
//   final extension = path.extension(file.path).toLowerCase();
//   switch (extension) {
//     case '.jpg':
//     case '.jpeg':
//       return MediaType('image', 'jpeg');
//     case '.png':
//       return MediaType('image', 'png');
//     case '.gif':
//       return MediaType('image', 'gif');
//     case '.mp4':
//       return MediaType('video', 'mp4');
//     default:
//       return MediaType('application', 'octet-stream');
//   }
// }
