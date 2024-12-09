import 'package:home4u/core/networking/api_result.dart';
import 'package:home4u/features/auth/sign_up/data/models/services/engineer_services.dart';
import 'package:home4u/features/auth/sign_up/data/models/services/engineer_type.dart';

import '../../../../../core/networking/api_error_handler.dart';
import '../data_source/engineer/engineer_sign_up_remote_data_source.dart';

abstract class EngineerSignUpRepository {
  Future<ApiResult<List<EngineerTypeData>>> getEngineerTypes();

  Future<ApiResult<List<EngineerServiceData>>> getEngineerServices(
      int engineerTypeId);
}

class EngineerSignUpRepositoryImpl implements EngineerSignUpRepository {
  final EngineerSignUpRemoteDataSource remoteDataSource;

  EngineerSignUpRepositoryImpl({required this.remoteDataSource});

  @override
  Future<ApiResult<List<EngineerTypeData>>> getEngineerTypes() async {
    try {
      final engineerTypeData = await remoteDataSource.getEngineerTypes();
      return ApiResult.success(engineerTypeData.data);
    } catch (error) {
      return Future.value(ApiResult.failure(ApiErrorHandler.handle(error)));
    }
  }

  @override
  Future<ApiResult<List<EngineerServiceData>>> getEngineerServices(
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
}
