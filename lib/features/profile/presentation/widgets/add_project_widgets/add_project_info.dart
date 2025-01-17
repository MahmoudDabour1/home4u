import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home4u/core/widgets/get_common_input_decoration.dart';
import 'package:home4u/features/profile/data/models/add_project_body.dart';
import 'package:home4u/features/profile/logic/project/project_cubit.dart';
import 'package:home4u/features/profile/logic/project/project_state.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;

import '../../../../../core/theming/app_assets.dart';
import '../../../../../core/utils/spacing.dart';
import '../../../../../core/widgets/app_custom_button.dart';
import '../../../../../core/widgets/app_text_form_field.dart';
import '../../../../../locale/app_locale.dart';

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
  final List<File> _selectedImagesFiles = [];
  final List<MultipartFile> _selectedImagesMultipart = [];

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
        File file = File(pickedFile.path);
        _selectedImagesFiles.add(file);
        _selectedImagesMultipart.add(MultipartFile.fromFileSync(pickedFile.path,
            filename: path.basename(pickedFile.path)));
      });
    }
  }

  void _deleteImage(int index) {
    setState(() {
      _selectedImagesFiles.removeAt(index);
      _selectedImagesMultipart.removeAt(index);
    });
  }

  void _viewImage(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            FullScreenImage(imageFile: _selectedImagesFiles[index]),
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
                      labelText: AppLocale.uploadProjectImages,
                      validator: (value) {
                        if (value.isEmpty && _selectedImagesFiles.isEmpty) {
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
                if (_selectedImagesFiles.isNotEmpty)
                  SizedBox(
                    height: 100.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _selectedImagesFiles.length,
                      itemBuilder: (context, index) {
                        return Stack(
                          children: [
                            GestureDetector(
                              onTap: () => _viewImage(index),
                              child: Padding(
                                padding: EdgeInsets.only(right: 8.w),
                                child: Image.file(
                                  _selectedImagesFiles[index],
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
                  labelText: AppLocale.projectDescription,
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.newline,
                  controller: projectDescriptionController,
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
                ),
                verticalSpace(16),
                Row(
                  children: [
                    Expanded(
                      child: AppTextFormField(
                        keyboardType: TextInputType.datetime,
                        controller: projectStartDateController,
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
                  labelText: AppLocale.projectTools,
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
                  textButton: AppLocale.confirm,
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
                      _selectedImagesMultipart,
                      _selectedImagesMultipart[0],
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
  final File imageFile;

  const FullScreenImage({super.key, required this.imageFile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Image.file(imageFile),
      ),
    );
  }
}
