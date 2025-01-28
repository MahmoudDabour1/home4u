import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home4u/core/networking/dio_factory.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/helpers/helper_methods.dart';
import '../../data/models/certifications/get_certifications_response_model.dart';
import '../../data/repos/certifications_repo.dart';
import 'certifications_state.dart';

class CertificationsCubit extends Cubit<CertificationsState> {
  final CertificationsRepo _certificationsRepository;

  CertificationsCubit(this._certificationsRepository)
      : super(CertificationsState.initial());

  static CertificationsCubit get(context) => BlocProvider.of(context);

  List<CertificationsData?>? certificationsList = [];
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  File? image;

  void selectImage({ImageSource? source}) {
    ImagePicker.platform.getImage(source: source!).then((value) {
      if (value != null) {
        image = File(value.path);
        emit(CertificationsState.addImage());
      }
    });
  }

  void chooseMyImage({ImageSource? source}) {
    ImagePicker.platform
        .getImage(
      source: source!,
    )
        .then((value) {
      if (value != null) {
        image = File(value.path);
        print(value.path);
        emit(CertificationsState.addImage());
      }
    });
  }

  Future<void> getAllCertifications() async {
    emit(CertificationsState.getAllCertificationsLoading());
    final response = await _certificationsRepository.getAllCertifications();
    response.when(
      success: (certificationsResponse) {
        certificationsList = certificationsResponse.data ?? [];
        emit(CertificationsState.getAllCertificationsSuccess(
            certificationsList));
      },
      failure: (error) {
        emit(CertificationsState.getAllCertificationsFailure(
            errorMessage: error.message.toString()));
      },
    );
  }

  Future<void> deleteCertification(int certificationId) async {
    emit( CertificationsState.deleteCertificationLoading());
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
      Map<String, dynamic> certificateMap = {
        'name': nameController.text,
        'description': descriptionController.text,
      };
      FormData formData = FormData.fromMap({
        'certificate': json.encode(certificateMap),
        'image': await MultipartFile.fromFile(
          image!.path,
          filename: image!.path.split('/').last, // Extract filename
          contentType: MediaType('image', 'jpeg'),
        ),
      });
      DioFactory.setContentType("multipart/form-data");
      final response =
          await _certificationsRepository.addCertification(formData);
      response.when(
        success: (_) {
          showToast(message: "Certification added successfully");
          emit(CertificationsState.addCertificationSuccess());
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
}
