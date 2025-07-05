import 'package:home4u/core/networking/api_result.dart';

import '../../../../core/networking/api_error_handler.dart';
import '../data_source/ask_requests/ask_requests_remote_data_source.dart';
import '../models/ask_requests/ask_engineer_request/ask_engineer_request_response_model.dart';
import '../models/ask_requests/ask_technical_request/ask_technical_request_response_model.dart';
import '../models/ask_requests/renovate_house_custom_package_request/renovate_house_custom_package_request_response_model.dart';
import '../models/ask_requests/renovate_house_request/renovate_house_request_response_model.dart';
import '../models/ask_requests/request_design_request/request_design_request_response_model.dart';

abstract class AskRequestsRepository {
  Future<ApiResult<RequestDesignRequestResponseModel>>
      getAskRequestDesignRequests({
    required String askId,
  });

  Future<ApiResult<AskTechnicalRequestResponseModel>> getAskTechnicalRequests({
    required String askId,
  });

  Future<ApiResult<AskEngineerRequestResponseModel>> getAskEngineerRequests({
    required String askId,
  });

  Future<ApiResult<RenovateHouseRequestResponseModel>>
      getAskRenovateHouseRequests({
    required String askId,
  });

  Future<ApiResult<RenovateHouseCustomPackageRequestResponseModel>>
      getAskRenovateHouseCustomPackageRequests({
    required String askId,
  });
}

class AskRequestsRepositoryImpl implements AskRequestsRepository {
  final AskRequestsRemoteDataSource _remoteDataSource;

  AskRequestsRepositoryImpl(this._remoteDataSource);

  @override
  Future<ApiResult<RequestDesignRequestResponseModel>>
      getAskRequestDesignRequests({required String askId}) async {
    try {
      final response =
          await _remoteDataSource.getAskRequestDesignRequests(askId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error.toString()));
    }
  }

  @override
  Future<ApiResult<AskTechnicalRequestResponseModel>> getAskTechnicalRequests({
    required String askId,
  }) async {
    try {
      final response = await _remoteDataSource.getAskTechnicalRequests(askId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error.toString()));
    }
  }

  @override
  Future<ApiResult<AskEngineerRequestResponseModel>> getAskEngineerRequests({
    required String askId,
  }) async {
    try {
      final response = await _remoteDataSource.getAskEngineerRequests(askId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error.toString()));
    }
  }

  @override
  Future<ApiResult<RenovateHouseRequestResponseModel>>
      getAskRenovateHouseRequests({required String askId}) async {
    try {
      final response =
          await _remoteDataSource.getAskRenovateHouseRequests(askId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error.toString()));
    }
  }

  @override
  Future<ApiResult<RenovateHouseCustomPackageRequestResponseModel>>
      getAskRenovateHouseCustomPackageRequests({required String askId}) async {
    try {
      final response = await _remoteDataSource
          .getAskRenovateHouseCustomPackageRequests(askId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error.toString()));
    }
  }
}
