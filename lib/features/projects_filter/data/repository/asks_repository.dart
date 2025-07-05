import 'package:home4u/core/networking/api_error_handler.dart';
import 'package:home4u/core/networking/api_result.dart';
import 'package:home4u/features/projects_filter/data/models/asks/engineer_ask/engineer_asks_response_model.dart';
import 'package:home4u/features/projects_filter/data/models/asks/technical_asks_response_model.dart';

import '../data_source/asks/asks_remote_data_source.dart';
import '../models/asks/renovate_house_ask/renovate_house_asks_response_model.dart';
import '../models/asks/renovate_house_custom_package_ask/renovate_house_custom_package_asks_response_model.dart';
import '../models/asks/request_design_ask/request_design_asks_response_model.dart';

abstract class AsksRepository {
  Future<ApiResult<TechnicalAsksResponseModel>> getTechnicalAsks({
    required String askId,
  });

  Future<ApiResult<EngineerAsksResponseModel>> getEngineerAsks({
    required String askId,
  });

  Future<ApiResult<RequestDesignAsksResponseModel>> getRequestDesignAsks({
    required String askId,
  });

  Future<ApiResult<RenovateHouseCustomPackageAsksResponseModel>>
      getRenovateHouseCustomPackageAsks({
    required String askId,
  });

  Future<ApiResult<RenovateHouseAsksResponseModel>> getRenovateHouseAsks({
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

  @override
  Future<ApiResult<EngineerAsksResponseModel>> getEngineerAsks(
      {required String askId}) async {
    try {
      final response = await _remoteDataSource.getEngineerAsks(askId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error.toString()));
    }
  }

  @override
  Future<ApiResult<RenovateHouseAsksResponseModel>> getRenovateHouseAsks(
      {required String askId}) async {
    try {
      final response = await _remoteDataSource.getRenovateHouseAsks(askId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error.toString()));
    }
  }

  @override
  Future<ApiResult<RenovateHouseCustomPackageAsksResponseModel>>
      getRenovateHouseCustomPackageAsks({required String askId}) async {
    try {
      final response =
          await _remoteDataSource.getRenovateHouseCustomPackageAsks(askId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error.toString()));
    }
  }

  @override
  Future<ApiResult<RequestDesignAsksResponseModel>> getRequestDesignAsks(
      {required String askId}) async {
    try {
      final response = await _remoteDataSource.getRequestDesignAsks(askId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error.toString()));
    }
  }
}
