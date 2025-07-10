import 'package:home4u/core/networking/api_result.dart';
import 'package:home4u/features/auth/sign_up/data/data_source/freelancer_sign_up/freelancer_sign_up_remote_data_source.dart';
import 'package:home4u/features/auth/sign_up/data/models/services/freelancer_services.dart';
import 'package:home4u/features/auth/sign_up/data/models/services/freelancer_types.dart';

import '../../../../../core/networking/api_error_handler.dart';

abstract class FreelancerSignUpRepository {
  Future<ApiResult<List<FreelancerTypeData>>> getEngineerTypes();

  Future<ApiResult<List<FreelancerServiceData>>> getEngineerServices(
      int engineerTypeId);

  Future<ApiResult<List<FreelancerTypeData>>> getTechnicalWorkerTypes();

  Future<ApiResult<List<FreelancerServiceData>>> getTechnicalWorkerServices(
      int technicalWorkerTypeId);

  Future<ApiResult<List<FreelancerTypeData>>> getEngineeringOfficeFields();

  Future<ApiResult<List<FreelancerServiceData>>> getEngineeringOfficeServices(
      int engineeringOfficeFieldId);
}

class FreelancerSignUpRepositoryImpl implements FreelancerSignUpRepository {
  final FreelancerSignUpRemoteDataSource remoteDataSource;

  FreelancerSignUpRepositoryImpl({required this.remoteDataSource});

  @override
  Future<ApiResult<List<FreelancerTypeData>>> getEngineerTypes() async {
    try {
      final engineerTypeData = await remoteDataSource.getEngineerTypes();
      return ApiResult.success(engineerTypeData.data);
    } catch (error) {
      return Future.value(ApiResult.failure(ApiErrorHandler.handle(error)));
    }
  }

  @override
  Future<ApiResult<List<FreelancerServiceData>>> getEngineerServices(
    int engineerTypeId,
  ) async {
    try {
      final engineerServiceData =
          await remoteDataSource.getEngineerServices(engineerTypeId);
      return ApiResult.success(engineerServiceData.data);
    } catch (error) {
      return Future.value(ApiResult.failure(ApiErrorHandler.handle(error)));
    }
  }

  @override
  Future<ApiResult<List<FreelancerTypeData>>> getTechnicalWorkerTypes() async {
    try {
      final technicalWorkerTypeData =
          await remoteDataSource.getTechnicalWorkerTypes();
      return ApiResult.success(technicalWorkerTypeData.data);
    } catch (error) {
      return Future.value(ApiResult.failure(ApiErrorHandler.handle(error)));
    }
  }

  @override
  Future<ApiResult<List<FreelancerServiceData>>> getTechnicalWorkerServices(
      int technicalWorkerTypeId) async {
    try {
      final technicalWorkerServiceData = await remoteDataSource
          .getTechnicalWorkerServices(technicalWorkerTypeId);
      return ApiResult.success(technicalWorkerServiceData.data);
    } catch (error) {
      return Future.value(ApiResult.failure(ApiErrorHandler.handle(error)));
    }
  }

  @override
  Future<ApiResult<List<FreelancerTypeData>>>
      getEngineeringOfficeFields() async {
    try {
      final engineeringOfficeFieldData =
          await remoteDataSource.getEngineeringOfficeFields();
      return ApiResult.success(engineeringOfficeFieldData.data);
    } catch (error) {
      return Future.value(ApiResult.failure(ApiErrorHandler.handle(error)));
    }
  }

  @override
  Future<ApiResult<List<FreelancerServiceData>>> getEngineeringOfficeServices(
      int engineeringOfficeFieldId) async {
    try {
      final engineeringOfficeServiceData = await remoteDataSource
          .getEngineeringOfficeServices(engineeringOfficeFieldId);
      return ApiResult.success(engineeringOfficeServiceData.data);
    } catch (error) {
      return Future.value(ApiResult.failure(ApiErrorHandler.handle(error)));
    }
  }
}
