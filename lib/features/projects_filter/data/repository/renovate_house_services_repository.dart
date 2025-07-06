import 'package:home4u/core/networking/api_result.dart';

import '../../../../core/networking/api_error_handler.dart';
import '../data_source/renovate_house/renovate_house_service_remote_data_source.dart';
import '../models/add_request/renovate_house/add_renovate_house_request_body.dart';
import '../models/add_request/renovate_house/renovate_house_single_request_response_model.dart';
import '../models/ask_requests/renovate_house_request/renovate_house_request_response_model.dart';
import '../models/asks/renovate_house_ask/renovate_house_asks_response_model.dart';
import '../models/details/renovate_house_details_response_model.dart';

abstract class RenovateHouseServicesRepository {
  Future<ApiResult<RenovateHouseSingleRequestResponseModel>>
      requestAskRenovateHouse(
    AddRenovateHouseRequestBody askRenovateHouseRequestBody,
  );

  Future<ApiResult<RenovateHouseRequestResponseModel>>
      getAskRenovateHouseRequests(
    String askId,
  );

  Future<ApiResult<RenovateHouseDetailsResponseModel>> renovateHouseDetails(
    String renovateId,
  );

  Future<ApiResult<RenovateHouseAsksResponseModel>> getRenovateHouseAsks(
    String askId,
  );
}

class RenovateHouseServicesRepositoryImpl
    implements RenovateHouseServicesRepository {
  final RenovateHouseServiceRemoteDataSource _remoteDataSource;

  RenovateHouseServicesRepositoryImpl(this._remoteDataSource);

  @override
  Future<ApiResult<RenovateHouseSingleRequestResponseModel>>
      requestAskRenovateHouse(
    AddRenovateHouseRequestBody askRenovateHouseRequestBody,
  ) async {
    try {
      final response = await _remoteDataSource
          .requestAskRenovateHouse(askRenovateHouseRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error.toString()));
    }
  }

  @override
  Future<ApiResult<RenovateHouseRequestResponseModel>>
      getAskRenovateHouseRequests(String askId) async {
    try {
      final response =
          await _remoteDataSource.getAskRenovateHouseRequests(askId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error.toString()));
    }
  }

  @override
  Future<ApiResult<RenovateHouseDetailsResponseModel>> renovateHouseDetails(
    String renovateId,
  ) async {
    try {
      final response = await _remoteDataSource.renovateHouseDetails(renovateId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error.toString()));
    }
  }

  @override
  Future<ApiResult<RenovateHouseAsksResponseModel>> getRenovateHouseAsks(
    String askId,
  ) async {
    try {
      final response = await _remoteDataSource.getRenovateHouseAsks(askId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error.toString()));
    }
  }
}
