import 'package:home4u/features/profile/data/data_sources/profile_local_data_source.dart';
import 'package:home4u/features/profile/data/data_sources/profile_remote_data_source.dart';
import 'package:home4u/features/profile/data/models/profile/profile_response_model.dart';
import 'package:home4u/core/networking/api_error_handler.dart';
import 'package:home4u/core/networking/api_result.dart';

abstract class ProfileRepo {
  Future<ApiResult<ProfileResponseModel>> getEngineerByToken();
  Future<ApiResult<ProfileResponseModel>> updateProfile(ProfileResponseModel profileData);
}

class ProfileRepoImp implements ProfileRepo {
  final ProfileRemoteDataSource _profileRemoteDataSource;
  final ProfileLocalDataSource _profileLocalDataSource;

  ProfileRepoImp(this._profileRemoteDataSource, this._profileLocalDataSource);

  @override
  Future<ApiResult<ProfileResponseModel>> getEngineerByToken() async {
    try {
      final cachedProfile = await _profileLocalDataSource.getProfileData();
      if (cachedProfile != null) {
        return ApiResult.success(cachedProfile);
      }
      final response = await _profileRemoteDataSource.getEngineerByToken();
      await _profileLocalDataSource.cacheProfileData(response);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<ProfileResponseModel>> updateProfile(ProfileResponseModel profileData) async {
    try {
      final response = await _profileRemoteDataSource.updateProfile(profileData);
      await _profileLocalDataSource.cacheProfileData(response);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
