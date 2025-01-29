import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../data_sources/profile_remote_data_source.dart';
import '../models/profile/get_engineer_response_model.dart';

abstract class ProfileRepo {
  Future<ApiResult<GetEngineerResponseModel>> getEngineerByToken();
}

class ProfileRepoImp implements ProfileRepo {
  final ProfileRemoteDataSource _profileRemoteDataSource;

  ProfileRepoImp(this._profileRemoteDataSource);

  @override
  Future<ApiResult<GetEngineerResponseModel>> getEngineerByToken() async {
    try {
      final response = await _profileRemoteDataSource.getEngineerByToken();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}