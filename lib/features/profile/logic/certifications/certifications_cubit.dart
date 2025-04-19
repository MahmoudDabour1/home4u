import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:home4u/core/extensions/navigation_extension.dart';
import 'package:home4u/core/networking/dio_factory.dart';
import 'package:home4u/locale/app_locale.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/helpers/helper_methods.dart';
import '../../data/repos/certifications_repo.dart';
import 'certifications_state.dart';

class CertificationsCubit extends Cubit<CertificationsState> {
  final CertificationsRepo _certificationsRepository;

  CertificationsCubit(this._certificationsRepository)
      : super(CertificationsState.initial());

  static CertificationsCubit get(context) => BlocProvider.of(context);

  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  List<File> image=[];
  final formKey = GlobalKey<FormState>();

  // void selectImage({required BuildContext context, ImageSource? source}) {
  //   final nav = Navigator.of(context);
  //   ImagePicker().pickImage(source: source!).then((value) {
  //     if (value != null) {
  //       image = File(value.path);
  //       nav.pop();
  //       emit(CertificationsState.addImage());
  //     }
  //   });
  // }

  void updateSelectedImages(List<File> newImages) {
    image = [ ...newImages];
    emit(CertificationsState.addImage());
  }

  Future<void> getAllCertifications() async {
    emit(const CertificationsState.getAllCertificationsLoading());
    final dio = DioFactory.getDio();
    dio.options.headers.remove('Content-Type');
    final response = await _certificationsRepository.getAllCertifications();
    response.when(
      success: (certificationsResponse) {
        if (!isClosed) {
          emit(CertificationsState.getAllCertificationsSuccess(
              certificationsResponse.data));
        }
      },
      failure: (error) {
        if (!isClosed) {
          emit(CertificationsState.getAllCertificationsFailure(
              errorMessage: error.message.toString()));
        }
      },
    );
  }

  Future<void> deleteCertification(int certificationId) async {
    emit(const CertificationsState.deleteCertificationLoading());
    final response = await _certificationsRepository
        .deleteCertificationById(certificationId);
    response.when(
      success: (deleteCertificationResponseModel) {
        if (!isClosed) {
          emit(const CertificationsState.deleteCertificationSuccess());
        }
      },
      failure: (error) {
        if (!isClosed) {
          emit(CertificationsState.deleteCertificationError(
              error: error.message.toString()));
        }
      },
    );
  }

  Future<void> addCertification(BuildContext context) async {
    if (image == null) {
      showToast(
          message: AppLocale.pleaseSelectAnImage.getString(context),
          isError: true);
      return;
    }
    emit(const CertificationsState.addCertificationLoading());
    try {
      final formData = await _createFormData();
      DioFactory.setContentTypeForMultipart();
      final response =
          await _certificationsRepository.addCertification(formData);
      response.when(
        success: (_) {
          showToast(
            message:
                AppLocale.certificationAddedSuccessfully.getString(context),
          );
          nameController.clear();
          descriptionController.clear();
          image = [];
          if (!isClosed) {
            emit(const CertificationsState.addCertificationSuccess());
            context.pop();
            getAllCertifications();
          }
        },
        failure: (error) {
          showToast(message: error.message.toString(), isError: true);
          if (!isClosed) {
            emit(CertificationsState.addCertificationError(
                errorMessage: error.message.toString()));
          }
        },
      );
    } catch (e) {
      showToast(
          message: AppLocale.errorUploadingCertification.getString(context),
          isError: true);
      if (!isClosed) {
        emit(CertificationsState.addCertificationError(
            errorMessage: e.toString()));
      }
    }
  }

  Future<void> getCertificationById(int certificationId) async {
    emit(const CertificationsState.getCertificationByIdLoading());
    final response =
        await _certificationsRepository.getCertificationById(certificationId);
    response.when(
      success: (certificationResponse) {
        if (!isClosed) {
          emit(CertificationsState.getCertificationByIdSuccess(
              certificationResponse));
        }
      },
      failure: (error) {
        if (!isClosed) {
          emit(CertificationsState.getCertificationByIdError(
              errorMessage: error.message.toString()));
        }
      },
    );
  }

  Future<void> updateCertification(
      int certificationId, BuildContext context) async {
    emit(CertificationsState.updateCertificationLoading());
    try {
      final formData = await _updateFormData(certificationId);
      final response =
          await _certificationsRepository.updateCertification(formData);
      response.when(
        success: (_) {
          showToast(
              message: AppLocale.certificationUpdatedSuccessfully
                  .getString(context));
          nameController.clear();
          descriptionController.clear();
          image = [];
          if (!isClosed) {
            emit(const CertificationsState.updateCertificationSuccess());
            context.pop();
            getAllCertifications();
          }
        },
        failure: (error) {
          showToast(message: error.message.toString(), isError: true);
          if (!isClosed) {
            emit(CertificationsState.updateCertificationError(
                errorMessage: error.message.toString()));
          }
        },
      );
    } catch (e) {
      showToast(
          message: AppLocale.errorUploadingCertification.getString(context),
          isError: true);
      if (!isClosed) {
        emit(CertificationsState.updateCertificationError(
            errorMessage: e.toString()));
      }
    }
  }

  Future<FormData> _createFormData() async {
    final certificateMap = {
      'name': nameController.text,
      'description': descriptionController.text,
    };
    final certificateJson = json.encode(certificateMap);
    DioFactory.setContentType("multipart/form-data");
    // final imageFile = await MultipartFile.fromFile(
    //   image!.path,
    //   filename: image!.path.split('/').last,
    //   contentType: MediaType('image', 'jpeg'),
    // );
    final imageFiles = image!
        .map((image) => MultipartFile.fromFileSync(
      image.path,
      filename: image.path.split("/").last,
      contentType: MediaType('image', 'jpeg'),
    ))
        .toList();
    return FormData.fromMap({
      'certificate': MultipartFile.fromString(
        certificateJson,
        contentType: MediaType('application', 'json'),
      ),
      'image': imageFiles,
    });
  }

  Future<FormData> _updateFormData(int certificationId) async {
    final certificateMap = {
      'id': certificationId,
      'name': nameController.text,
      'description': descriptionController.text,
    };
    final certificateJson = json.encode(certificateMap);
    DioFactory.setContentType("multipart/form-data");
    // final imageFile = await MultipartFile.fromFile(
    //   image!.path,
    //   filename: image!.path.split('/').last,
    //   contentType: MediaType('image', 'jpeg'),
    // );
    final imageFiles = image!
        .map((image) => MultipartFile.fromFileSync(
      image.path,
      filename: image.path.split("/").last,
      contentType: MediaType('image', 'jpeg'),
    ))
        .toList();
    return FormData.fromMap({
      'certificate': MultipartFile.fromString(
        certificateJson,
        contentType: MediaType('application', 'json'),
      ),
      'image': imageFiles,
    });
  }
}
