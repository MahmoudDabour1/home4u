import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home4u/core/networking/dio_factory.dart';
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
  File? image;

  void selectImage({required BuildContext context, ImageSource? source}) {
    ImagePicker.platform
        .getImage(
      source: source!,
    )
        .then((value) {
      if (value != null) {
        image = File(value.path);
        Navigator.pop(context);
        emit(CertificationsState.addImage());
      }
    });
  }

  Future<void> getAllCertifications() async {
    emit(CertificationsState.getAllCertificationsLoading());
    final response = await _certificationsRepository.getAllCertifications();
    response.when(
      success: (certificationsResponse) {
        emit(
          CertificationsState.getAllCertificationsSuccess(
            certificationsResponse.data,
          ),
        );
      },
      failure: (error) {
        emit(CertificationsState.getAllCertificationsFailure(
            errorMessage: error.message.toString()));
      },
    );
  }

  Future<void> deleteCertification(int certificationId) async {
    emit(CertificationsState.deleteCertificationLoading());
    final response = await _certificationsRepository
        .deleteCertificationById(certificationId);
    response.when(
      success: (deleteCertificationResponseModel) {
        emit(const CertificationsState.deleteCertificationSuccess());
      },
      failure: (error) {
        emit(CertificationsState.deleteCertificationError(
            error: error.message.toString()));
      },
    );
  }

  Future<void> addCertification() async {
    if (nameController.text.isEmpty || descriptionController.text.isEmpty) {
      showToast(
          message: "Name and description must not be empty", isError: true);
      return;
    }

    if (image == null) {
      showToast(message: "Please select an image", isError: true);
      return;
    }
    emit(CertificationsState.addCertificationLoading());
    try {
      final formData = await _createFormData();
      final response =
          await _certificationsRepository.addCertification(formData);
      response.when(
        success: (_) {
          showToast(message: "Certification added successfully");
          emit(CertificationsState.addCertificationSuccess());
          nameController.clear();
          descriptionController.clear();
          image = null;
        },
        failure: (error) {
          showToast(message: error.message.toString(), isError: true);
          emit(CertificationsState.addCertificationError(
              errorMessage: error.message.toString()));
        },
      );
    } catch (e) {
      showToast(message: "Error uploading certification", isError: true);
      emit(CertificationsState.addCertificationError(
          errorMessage: e.toString()));
    }
  }

  Future<void> updateCertification(int certificationId) async {
    emit(CertificationsState.updateCertificationLoading());
    try {
      final formData = await _updateFormData(certificationId);
      final response =
          await _certificationsRepository.updateCertification(formData);
      response.when(
        success: (_) {
          showToast(message: "Certification updated successfully");
          emit(CertificationsState.updateCertificationSuccess());
        },
        failure: (error) {
          showToast(message: error.message.toString(), isError: true);
          emit(CertificationsState.updateCertificationError(
              errorMessage: error.message.toString()));
        },
      );
    } catch (e) {
      showToast(message: "Error updating certification", isError: true);
      emit(CertificationsState.updateCertificationError(
          errorMessage: e.toString()));
    }
  }

  Future<FormData> _createFormData() async {
    final certificateMap = {
      'name': nameController.text,
      'description': descriptionController.text,
    };
    final certificateJson = json.encode(certificateMap);
    DioFactory.setContentType("multipart/form-data");
    final imageFile = await MultipartFile.fromFile(
      image!.path,
      filename: image!.path.split('/').last,
      contentType: MediaType('image', 'jpeg'),
    );
    return FormData.fromMap({
      'certificate': MultipartFile.fromString(
        certificateJson,
        contentType: MediaType('application', 'json'),
      ),
      'image': imageFile,
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
    final imageFile = await MultipartFile.fromFile(
      image!.path,
      filename: image!.path.split('/').last,
      contentType: MediaType('image', 'jpeg'),
    );
    return FormData.fromMap({
      'certificate': MultipartFile.fromString(
        certificateJson,
        contentType: MediaType('application', 'json'),
      ),
      'image': imageFile,
    });
  }
}
