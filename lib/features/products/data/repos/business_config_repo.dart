import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../data_source/business_config_remote_data_source.dart';
import '../models/business_config_model.dart';

abstract class BusinessConfigRepo {
  Future<ApiResult<BusinessConfigModel>> getBusinessConfig();
}

class BusinessConfigRepoImpl implements BusinessConfigRepo {
  final BusinessConfigRemoteDataSource remoteDataSource;

  BusinessConfigRepoImpl({required this.remoteDataSource});

  @override
  Future<ApiResult<BusinessConfigModel>> getBusinessConfig() async {
    try {
      final response = await remoteDataSource.getBusinessConfig();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}