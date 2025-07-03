import 'package:home4u/core/networking/api_result.dart';

import '../../../../core/networking/api_error_handler.dart';
import '../data_source/project_details/project_details_remote_data_source.dart';
import '../models/details/ask_engineer_project_details_response_model.dart';
import '../models/details/ask_technical_project_details_response_model.dart';
import '../models/details/renovate_house_details_response_model.dart';
import '../models/details/renovate_house_fixed_package_details_response_model.dart';
import '../models/details/request_design_project_details_response_model.dart';

abstract class ServicesProjectDetailsRepository {
  Future<ApiResult<AskTechnicalProjectDetailsResponseModel>>
      getAskTechnicalServiceDetails(String askId);

  Future<ApiResult<AskEngineerProjectDetailsResponseModel>>
      getAskEngineerServiceDetails(String askId);

  Future<ApiResult<RenovateHouseDetailsResponseModel>> getRenovateHouseDetails(
      String renovateId);

  Future<ApiResult<RenovateHouseFixedPackageDetailsResponseModel>>
      getRenovateHouseFixedPackageDetails(String packageId);

  Future<ApiResult<RequestDesignProjectDetailsResponseModel>>
      getRequestDesignDetails(String requestId);
}

class ServicesProjectDetailsRepositoryImpl
    implements ServicesProjectDetailsRepository {
  final ProjectDetailsRemoteDataSource _remoteDataSource;

  ServicesProjectDetailsRepositoryImpl(this._remoteDataSource);

  @override
  Future<ApiResult<AskEngineerProjectDetailsResponseModel>>
      getAskEngineerServiceDetails(String askId) async {
    try {
      final response =
          await _remoteDataSource.askEngineerServiceDetails(askId);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e.toString()));
    }
  }

  @override
  Future<ApiResult<AskTechnicalProjectDetailsResponseModel>>
      getAskTechnicalServiceDetails(String askId) async {
    try {
      final response =
          await _remoteDataSource.askTechnicalServiceDetails(askId);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e.toString()));
    }
  }

  @override
  Future<ApiResult<RenovateHouseDetailsResponseModel>> getRenovateHouseDetails(
      String renovateId) async {
    try {
      final response =
          await _remoteDataSource.renovateHouseDetails(renovateId);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e.toString()));
    }
  }

  @override
  Future<ApiResult<RenovateHouseFixedPackageDetailsResponseModel>>
      getRenovateHouseFixedPackageDetails(String packageId) async {
    try {
      final response = await _remoteDataSource
          .renovateHouseFixedPackageDetails(packageId);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e.toString()));
    }
  }

  @override
  Future<ApiResult<RequestDesignProjectDetailsResponseModel>>
      getRequestDesignDetails(String requestId) async {
    try {
      final response =
          await _remoteDataSource.requestDesignDetails(requestId);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e.toString()));
    }
  }
}
