import 'package:home4u/core/networking/api_error_handler.dart';
import 'package:home4u/core/networking/api_result.dart';
import 'package:home4u/features/projects_filter/data/models/asks/technical_asks_response_model.dart';

import '../data_source/asks/asks_remote_data_source.dart';

abstract class AsksRepository {
  Future<ApiResult<TechnicalAsksResponseModel>> getTechnicalAsks({
    required String askId,
  });
}

class AsksRepositoryImpl implements AsksRepository {
  final AsksRemoteDataSource _remoteDataSource;

  AsksRepositoryImpl(this._remoteDataSource);

  @override
  Future<ApiResult<TechnicalAsksResponseModel>> getTechnicalAsks({
    required String askId,
  }) async {
    try {
      final response = await _remoteDataSource.getTechnicalAsks(askId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error.toString()));
    }
  }
}
