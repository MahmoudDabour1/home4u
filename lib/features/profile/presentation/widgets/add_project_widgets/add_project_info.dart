import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home4u/core/widgets/get_common_input_decoration.dart';

import '../../../../../core/theming/app_assets.dart';
import '../../../../../core/theming/app_strings.dart';
import '../../../../../core/utils/spacing.dart';
import '../../../../../core/widgets/app_text_form_field.dart';
import 'add_project_details_button.dart';

class AddProjectInfo extends StatefulWidget {
  const AddProjectInfo({super.key});

  @override
  State<AddProjectInfo> createState() => _AddProjectInfoState();
}

class _AddProjectInfoState extends State<AddProjectInfo> {
  late TextEditingController projectDescriptionController;

  @override
  void initState() {
    super.initState();
    projectDescriptionController = TextEditingController();
  }

  @override
  void dispose() {
    projectDescriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0).w,
      child: Column(
        children: [
          verticalSpace(32),
          AppTextFormField(
            labelText: AppStrings.uploadProjectImages,
            validator: (value) {
              if (value.isEmpty) {
                return "Please enter your project images";
              }
              return null;
            },
            suffixIcon: SizedBox(
              width: 24.w,
              height: 20.h,
              child: Align(
                child: SvgPicture.asset(
                  AppAssets.loadImageSvgImage,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          verticalSpace(16),
          AppTextFormField(
            labelText: AppStrings.projectDescription,
            keyboardType: TextInputType.multiline,
            textInputAction: TextInputAction.newline,
            controller: TextEditingController(),
            decoration: getCommonInputDecoration(
                    labelText: AppStrings.projectDescription)
                .copyWith(
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
          ),
          verticalSpace(16),
          Row(
            children: [
              Expanded(
                child: AppTextFormField(
                  labelText: AppStrings.projectStartData,
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
                  labelText: AppStrings.projectEndData,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Please enter your end date";
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
          verticalSpace(16),
          AppTextFormField(
            labelText: AppStrings.projectTools,
            validator: (value) {
              if (value.isEmpty) {
                return "Please enter your project location";
              }
              return null;
            },
          ),
          verticalSpace(32),
          AddProjectDetailsButton(),
        ],
      ),
    );
  }
}
