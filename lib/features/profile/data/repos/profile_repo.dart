import 'package:dio/dio.dart';
import 'package:home4u/core/networking/api_error_handler.dart';
import 'package:home4u/core/networking/api_result.dart';
import 'package:home4u/features/profile/data/data_sources/profile_local_data_source.dart';
import 'package:home4u/features/profile/data/data_sources/profile_remote_data_source.dart';
import 'package:home4u/features/profile/data/models/profile/engineer_profile_response_model.dart';
import 'package:home4u/features/profile/data/models/profile/engineering_office_profile_response_model.dart';
import 'package:home4u/features/profile/data/models/profile/technical_worker_profile_response_model.dart';
import 'package:home4u/features/profile/data/models/profile/upload_profile_image_response_model.dart';

abstract class ProfileRepo {
  Future<ApiResult<EngineerProfileResponseModel>> getEngineerByToken();

  Future<ApiResult<TechnicalWorkerResponseModel>> getTechnicalWorkerByToken();

  Future<ApiResult<EngineeringOfficeProfileResponseModel>>
      getEngineeringOfficeByToken();

  Future<ApiResult<EngineerProfileResponseModel>> updateEngineerProfile(
    String profileResponseModel,
  );

  Future<ApiResult<TechnicalWorkerResponseModel>> updateTechnicalWorkerProfile(
    String profileResponseModel,
  );
  Future<ApiResult<EngineeringOfficeProfileResponseModel>> updateEngineeringOfficeProfile(
    String profileResponseModel,
  );


  Future<ApiResult<UploadProfileImageResponseModel>> uploadProfileImage(
      FormData formData);
}

class ProfileRepoImp implements ProfileRepo {
  final ProfileRemoteDataSource _profileRemoteDataSource;
  final ProfileLocalDataSource _profileLocalDataSource;

  ProfileRepoImp(this._profileRemoteDataSource, this._profileLocalDataSource);

  @override
  Future<ApiResult<EngineerProfileResponseModel>> getEngineerByToken() async {
    try {
      final response = await _profileRemoteDataSource.getEngineerByToken();
      await _profileLocalDataSource.cacheEngineerProfileData(response);
      return ApiResult.success(response);
    } catch (error) {
      final cachedProfile =
          await _profileLocalDataSource.getEngineerProfileData();
      if (cachedProfile != null) {
        return ApiResult.success(cachedProfile);
      }
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<TechnicalWorkerResponseModel>>
      getTechnicalWorkerByToken() async {
    try {
      final response =
          await _profileRemoteDataSource.getTechnicalWorkerByToken();
      await _profileLocalDataSource.cacheTechnicalWorkerProfileData(response);
      return ApiResult.success(response);
    } catch (error) {
      final cachedProfile =
          await _profileLocalDataSource.getTechnicalWorkerProfileData();
      if (cachedProfile != null) {
        return ApiResult.success(cachedProfile);
      }
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<EngineeringOfficeProfileResponseModel>>
      getEngineeringOfficeByToken() async {
    try {
      final response =
          await _profileRemoteDataSource.getEngineeringOfficeByToken();
      // await _profileLocalDataSource.cacheEngineerProfileData(response);
      return ApiResult.success(response!);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<EngineerProfileResponseModel>> updateEngineerProfile(
      String profileResponseModel) async {
    try {
      final response = await _profileRemoteDataSource
          .updateEngineerProfile(profileResponseModel);
      await _profileLocalDataSource.cacheEngineerProfileData(response);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<TechnicalWorkerResponseModel>> updateTechnicalWorkerProfile(
      String profileResponseModel) async {
    try {
      final response = await _profileRemoteDataSource
          .updateTechnicalWorkerProfile(profileResponseModel);
      await _profileLocalDataSource.cacheTechnicalWorkerProfileData(response);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<EngineeringOfficeProfileResponseModel>> updateEngineeringOfficeProfile(String profileResponseModel) async{
try{
  final response = await _profileRemoteDataSource
          .updateEngineeringOfficeProfile(profileResponseModel);
      await _profileLocalDataSource.cacheEngineeringOfficeProfileData(response);
      return ApiResult.success(response);
}catch(error){
  return ApiResult.failure(ApiErrorHandler.handle(error));
}
  }

  @override
  Future<ApiResult<UploadProfileImageResponseModel>> uploadProfileImage(
      FormData formData) async {
    try {
      final response =
          await _profileRemoteDataSource.uploadProfileImage(formData);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

}
