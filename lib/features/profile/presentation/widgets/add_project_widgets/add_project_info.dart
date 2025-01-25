import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home4u/core/widgets/get_common_input_decoration.dart';
import 'package:home4u/features/profile/logic/project/project_cubit.dart';
import 'package:home4u/features/profile/logic/project/project_state.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:path/path.dart' as path;

import '../../../../../core/networking/dio_factory.dart';
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
  File? _coverImageFile;
  MultipartFile? _coverImageMultipart;

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
        _selectedImagesMultipart.add(
          MultipartFile.fromFileSync(
            pickedFile.path,
            filename: pickedFile.path.split('/').last,
            contentType: getContentType(file),
          ),
        );
        debugPrint("Selected Images: ${pickedFile.path}");
      });
    }
  }

  Future<void> _pickCoverImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _coverImageFile = File(pickedFile.path);
        _coverImageMultipart = MultipartFile.fromFileSync(
          pickedFile.path,
          filename: pickedFile.path.split('/').last,
          contentType: getContentType(_coverImageFile!),
        );
        debugPrint("Selected Cover Image: ${pickedFile.path}");
      });
    }
  }

  void _deleteImage(int index) {
    setState(() {
      _selectedImagesFiles.removeAt(index);
      _selectedImagesMultipart.removeAt(index);
    });
  }

  void _deleteCoverImage() {
    setState(() {
      _coverImageFile = null;
      _coverImageMultipart = null;
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
                _buildImagePickerField(context),
                verticalSpace(16),
                _buildSelectedImagesList(),
                verticalSpace(16),
                _buildCoverImagePickerField(),
                verticalSpace(16),
                _buildCoverImagePreview(),
                verticalSpace(16),
                _buildProjectNameField(),
                verticalSpace(16),
                _buildProjectDescriptionField(),
                verticalSpace(16),
                _buildProjectDatesFields(),
                verticalSpace(16),
                _buildProjectToolsField(),
                verticalSpace(32),
                _buildSubmitButton(context, state),
                verticalSpace(64),
              ],
            ),
          );
        }
      },
    );
  }

  Widget _buildImagePickerField(BuildContext context) {
    return GestureDetector(
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
    );
  }

  Widget _buildSelectedImagesList() {
    if (_selectedImagesFiles.isEmpty) return SizedBox.shrink();
    return SizedBox(
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
    );
  }

  Widget _buildCoverImagePickerField() {
    return GestureDetector(
      onTap: () => _pickCoverImage(ImageSource.gallery),
      child: AbsorbPointer(
        child: AppTextFormField(
          labelText: "Upload Cover Image",
          validator: (value) {
            if (value.isEmpty && _coverImageFile == null) {
              return "Please upload a cover image";
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
    );
  }

  Widget _buildCoverImagePreview() {
    if (_coverImageFile == null) return SizedBox.shrink();
    return Stack(
      children: [
        Image.file(
          _coverImageFile!,
          width: 100.w,
          height: 100.h,
          fit: BoxFit.cover,
        ),
        Positioned(
          right: 0,
          child: IconButton(
            icon: Icon(Icons.delete, color: Colors.red),
            onPressed: _deleteCoverImage,
          ),
        ),
      ],
    );
  }

  Widget _buildProjectNameField() {
    return AppTextFormField(
      labelText: "Project Name",
      controller: projectNameController,
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value.isEmpty) {
          return "Please enter your project name";
        }
        return null;
      },
    );
  }

  Widget _buildProjectDescriptionField() {
    return AppTextFormField(
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
    );
  }

  Widget _buildProjectDatesFields() {
    return Row(
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
    );
  }

  Widget _buildProjectToolsField() {
    return AppTextFormField(
      labelText: AppLocale.projectTools,
      keyboardType: TextInputType.text,
      controller: projectToolsController,
      validator: (value) {
        if (value.isEmpty) {
          return "Please enter your project location";
        }
        return null;
      },
    );
  }

  Widget _buildSubmitButton(BuildContext context, ProjectState state) {
    return AppCustomButton(
      isLoading: state is ProjectLoadingState,
      textButton: AppLocale.confirm,
      btnWidth: MediaQuery.sizeOf(context).width,
      btnHeight: 65.h,
      onPressed: () {
        final cubit = context.read<ProjectCubit>();
        DioFactory.setContentType('multipart/form-data');

        final formData = FormData.fromMap({
          "cover": _coverImageMultipart,
          "images": _selectedImagesMultipart,
          "projectData": jsonEncode({
            "name": projectNameController.text,
            "description": projectDescriptionController.text,
            "startDate": projectStartDateController.text,
            "endDate": projectEndDateController.text,
            "tools": projectToolsController.text,
          }),
        });
        final logger = Logger();
        // Debug print to check the FormData
        logger.w("FormData: ${formData.fields}");
        logger.w("Cover Image: ${_coverImageMultipart?.filename}");
        logger.w(
            "Images: ${_selectedImagesMultipart.map((file) => file.filename).toList()}");

        cubit.addProject(formData);
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

MediaType getContentType(File file) {
  final extension = path.extension(file.path).toLowerCase();
  switch (extension) {
    case '.jpg':
    case '.jpeg':
      return MediaType('image', 'jpeg');
    case '.png':
      return MediaType('image', 'png');
    case '.gif':
      return MediaType('image', 'gif');
    case '.mp4':
      return MediaType('video', 'mp4');
    default:
      return MediaType('application', 'octet-stream');
  }
}
