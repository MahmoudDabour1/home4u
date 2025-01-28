import 'package:dio/dio.dart';
import 'package:home4u/core/networking/api_result.dart';
import 'package:home4u/features/profile/data/models/certifications/add_certification_response_model.dart';
import 'package:home4u/features/profile/data/models/certifications/delete_certification_response_model.dart';
import 'package:home4u/features/profile/data/models/certifications/get_certifications_response_model.dart';

import '../../../../core/networking/api_error_handler.dart';
import '../data_sources/certifications_remote_data_source.dart';

abstract class CertificationsRepo {
  Future<ApiResult<GetCertificationsResponseModel>> getAllCertifications();

  Future<ApiResult<DeleteCertificationResponseModel>> deleteCertificationById(
      int certificationId);

  Future<ApiResult<AddCertificationResponseModel>> addCertification(FormData formData);
}

class CertificationsRepoImpl implements CertificationsRepo {
  final CertificationsRemoteDataSource _certificationsRemoteDataSource;

  CertificationsRepoImpl(this._certificationsRemoteDataSource);

  @override
  Future<ApiResult<GetCertificationsResponseModel>>
      getAllCertifications() async {
    try {
      final response =
          await _certificationsRemoteDataSource.getCertifications();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<DeleteCertificationResponseModel>> deleteCertificationById(
      int certificationId) async {
    try {
      final response = await _certificationsRemoteDataSource
          .deleteCertification(certificationId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<AddCertificationResponseModel>> addCertification(FormData formData) async {
    try {
      final response = await _certificationsRemoteDataSource
          .addCertification(formData);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
