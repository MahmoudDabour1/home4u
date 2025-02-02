import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/networking/api_constants.dart';
import 'package:home4u/core/utils/spacing.dart';
import 'package:home4u/features/profile/logic/certifications/certifications_cubit.dart';
import 'package:home4u/features/profile/logic/certifications/certifications_state.dart';
import 'package:home4u/locale/app_locale.dart';
import '../../../../../core/helpers/helper_methods.dart';
import '../../../../../core/widgets/app_custom_button.dart';
import '../../../../../core/widgets/app_text_form_field.dart';
import '../../../../../core/widgets/select_image_widget.dart';
import '../../../data/models/certifications/get_certifications_response_model.dart';
import 'package:path_provider/path_provider.dart';


class AddCertificationsInfo extends StatelessWidget {
  final CertificationsData? certificationData;

  const AddCertificationsInfo({super.key, this.certificationData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: BlocBuilder<CertificationsCubit, CertificationsState>(
        builder: (context, state) {
          final cubit = CertificationsCubit.get(context);
          if (certificationData != null) {
            cubit.nameController.text = certificationData!.name ?? '';
            cubit.descriptionController.text =
                certificationData!.description ?? '';
            _loadImageFromUrl(context, "${ApiConstants.getImageBaseUrl}${certificationData!.imagePath}");
            // if (certificationData!.imagePath != null) {
            //   final file = File(certificationData!.imagePath!);
            //   if (file.existsSync()) {
            //     cubit.image = file;
            //   } else {
            //     // Handle the case where the file does not exist
            //     showToast(
            //       message: "fileNotFound",
            //       isError:true,
            //     );
            //   }
            // }
          }

          return Form(
            key: cubit.formKey,
            child: Column(
              children: [
                SelectImageWidget(
                  cubit: cubit,
                  images: [if (cubit.image != null) cubit.image!],
                  isCoverImage: false,
                  isEdit: certificationData != null,
                ),
                verticalSpace(16),
                AppTextFormField(
                  labelText: AppLocale.name.getString(context),
                  validator: (value) {
                    if (value.isEmpty) {
                      return AppLocale.nameCantBeEmpty.getString(context);
                    }
                  },
                  controller: cubit.nameController,
                ),
                verticalSpace(16),
                AppTextFormField(
                  labelText: AppLocale.description.getString(context),
                  validator: (value) {
                    if (value.isEmpty) {
                      return AppLocale.descriptionCantBeEmpty
                          .getString(context);
                    }
                  },
                  controller: cubit.descriptionController,
                ),
                verticalSpace(30),
                AppCustomButton(
                  textButton: certificationData != null
                      ? AppLocale.update.getString(context)
                      : AppLocale.add.getString(context),
                  btnWidth: MediaQuery.sizeOf(context).width,
                  isLoading: state is UpdateCertificationLoading||state is AddCertificationLoading,
                  btnHeight: 60.h,
                  onPressed: () {
                    if (cubit.formKey.currentState!.validate()) {
                      if (certificationData != null) {
                        cubit.updateCertification(
                            certificationData!.id!, context);
                      } else {
                        cubit.addCertification(context);
                      }
                    }
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }
  // Future<void> _loadImageFromUrl(BuildContext context, String url) async {
  //   final cubit = CertificationsCubit.get(context);
  //   try {
  //     final dio = Dio();
  //     final response = await dio.get(url, options: Options(responseType: ResponseType.bytes));
  //     if (response.statusCode == 200) {
  //       final directory = await getTemporaryDirectory();
  //       final file = File('${directory.path}/temp_image.jpg');
  //       await file.writeAsBytes(response.data);
  //       cubit.image = file;
  //     } else {
  //       showToast(
  //         message: "Failed to load image",
  //         isError: true,
  //       );
  //     }
  //   } catch (e) {
  //     showToast(
  //       message: "Error loading image: $e",
  //       isError: true,
  //     );
  //   }
  // }

  Future<void> _loadImageFromUrl(BuildContext context, String url) async {
    final cubit = CertificationsCubit.get(context);
    try {
      final dio = Dio();
      final response = await dio.get(url, options: Options(responseType: ResponseType.bytes));
      if (response.statusCode == 200) {
        final directory = await getTemporaryDirectory();
        final file = File('${directory.path}/temp_image.jpg');
        await file.writeAsBytes(response.data);
        cubit.image = file;
        print('Image loaded successfully: ${file.path}');
      } else {
        showToast(
          message: "Failed to load image",
          isError: true,
        );
        print('Failed to load image: ${response.statusCode}');
      }
    } catch (e) {
      showToast(
        message: "Error loading image: $e",
        isError: true,
      );
      print('Error loading image: $e');
    }
  }
}
