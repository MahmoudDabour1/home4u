import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home4u/core/widgets/get_common_input_decoration.dart';
import 'package:home4u/features/profile/data/models/add_project_body.dart';
import 'package:image_picker/image_picker.dart';
import 'package:home4u/features/profile/logic/project/project_cubit.dart';
import 'package:home4u/features/profile/logic/project/project_state.dart';

import '../../../../../core/theming/app_assets.dart';
import '../../../../../core/theming/app_strings.dart';
import '../../../../../core/utils/spacing.dart';
import '../../../../../core/widgets/app_custom_button.dart';
import '../../../../../core/widgets/app_text_form_field.dart';
import 'add_project_details_button.dart';

class AddProjectInfo extends StatefulWidget {
  const AddProjectInfo({super.key});

  @override
  State<AddProjectInfo> createState() => _AddProjectInfoState();
}

class _AddProjectInfoState extends State<AddProjectInfo> {
  late TextEditingController projectDescriptionController;
  late TextEditingController projectNameController;
  late TextEditingController projectStartDateController;
  late TextEditingController projectEndDateController;
  late TextEditingController projectToolsController;
  final ImagePicker _picker = ImagePicker();
  final List<File> _selectedImages = [];

  @override
  void initState() {
    super.initState();
    projectDescriptionController = TextEditingController();
    projectNameController = TextEditingController();
    projectStartDateController = TextEditingController();
    projectEndDateController = TextEditingController();
    projectToolsController = TextEditingController();
  }

  @override
  void dispose() {
    projectDescriptionController.dispose();
    projectNameController.dispose();
    projectStartDateController.dispose();
    projectEndDateController.dispose();
    projectToolsController.dispose();
    super.dispose();
  }

  Future<void> _showImagePickerOptions(BuildContext context) async {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Gallery'),
                onTap: () {
                  _pickImage(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_camera),
                title: Text('Camera'),
                onTap: () {
                  _pickImage(ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _selectedImages.add(File(pickedFile.path));
      });
    }
  }

  void _deleteImage(int index) {
    setState(() {
      _selectedImages.removeAt(index);
    });
  }

  void _viewImage(String path) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FullScreenImage(imagePath: path),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectCubit, ProjectState>(
      builder: (context, state) {
        if (state is ProjectFailureState) {
          return Center(child: Text(state.errorMessage));
        } else {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0).w,
            child: Column(
              children: [
                verticalSpace(32),
                GestureDetector(
                  onTap: () => _showImagePickerOptions(context),
                  child: AbsorbPointer(
                    child: AppTextFormField(
                      labelText: AppStrings.uploadProjectImages,
                      validator: (value) {
                        if (value.isEmpty && _selectedImages.isEmpty) {
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
                  ),
                ),
                verticalSpace(16),
                if (_selectedImages.isNotEmpty)
                  SizedBox(
                    height: 100.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _selectedImages.length,
                      itemBuilder: (context, index) {
                        return Stack(
                          children: [
                            GestureDetector(
                              onTap: () =>
                                  _viewImage(_selectedImages[index].path),
                              child: Padding(
                                padding: EdgeInsets.only(right: 8.w),
                                child: Image.file(
                                  File(_selectedImages[index].path),
                                  width: 100.w,
                                  height: 100.h,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              right: 0,
                              child: IconButton(
                                icon: Icon(Icons.delete, color: Colors.red),
                                onPressed: () => _deleteImage(index),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                verticalSpace(16),
                AppTextFormField(
                    labelText: "Project Name",
                    controller: projectNameController,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Please enter your project name";
                      }
                      return null;
                    }),
                verticalSpace(16),
                AppTextFormField(
                  labelText: AppStrings.projectDescription,
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.newline,
                  controller: projectDescriptionController,
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
                        keyboardType: TextInputType.datetime,
                        controller: projectStartDateController,
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
                        keyboardType: TextInputType.datetime,
                        controller: projectEndDateController,
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
                  keyboardType: TextInputType.text,
                  controller: projectToolsController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Please enter your project location";
                    }
                    return null;
                  },
                ),
                verticalSpace(32),
                AppCustomButton(
                  isLoading: state is ProjectLoadingState,
                  textButton: AppStrings.confirm,
                  btnWidth: MediaQuery.sizeOf(context).width,
                  btnHeight: 65.h,
                  onPressed: () {
                    final cubit = context.read<ProjectCubit>();
                    cubit.addProject(
                      AddProjectBody(
                        name: projectNameController.text,
                        description: projectDescriptionController.text,
                        startDate: projectStartDateController.text,
                        endDate: projectEndDateController.text,
                        tools: projectToolsController.text,
                      ),
                      _selectedImages.isNotEmpty ? _selectedImages : null,
                      null,
                    );
                  },
                ),
                verticalSpace(64),
              ],
            ),
          );
        }
      },
    );
  }
}

class FullScreenImage extends StatelessWidget {
  final String imagePath;

  const FullScreenImage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Image.file(File(imagePath)),
      ),
    );
  }
}
