import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../data_source/renovate_house_custom_package/renovate_house_custom_package_service_remote_data_source.dart';
import '../models/add_request/renovate_house_custom_package/add_renovate_house_custom_package_request_body.dart';
import '../models/add_request/renovate_house_custom_package/renovate_house_custom_package_single_request_response_model.dart';
import '../models/ask_requests/renovate_house_custom_package_request/renovate_house_custom_package_request_response_model.dart';
import '../models/asks/renovate_house_custom_package_ask/renovate_house_custom_package_asks_response_model.dart';
import '../models/details/renovate_house_fixed_package_details_response_model.dart';

abstract class RenovateHouseCustomPackageServicesRepository {
  Future<ApiResult<RenovateHouseCustomPackageAsksResponseModel>>
      getRenovateHouseCustomPackageAsks({required String askId});

  Future<ApiResult<RenovateHouseCustomPackageSingleRequestResponseModel>>
      requestAskRenovateHouseCustomPackage({
    required AddRenovateHouseCustomPackageRequestBody
        askRenovateHouseCustomPackageRequestBody,
  });

  Future<ApiResult<RenovateHouseFixedPackageDetailsResponseModel>>
      renovateHouseFixedPackageDetails({required String packageId});

  Future<ApiResult<RenovateHouseCustomPackageRequestResponseModel>>
      getAskRenovateHouseCustomPackageRequests({required String askId});
}

class RenovateHouseCustomPackageServicesRepositoryImpl
    implements RenovateHouseCustomPackageServicesRepository {
  final RenovateHouseCustomPackageServiceRemoteDataSource _remoteDataSource;

  RenovateHouseCustomPackageServicesRepositoryImpl(
      this._remoteDataSource);

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
  Future<ApiResult<RenovateHouseCustomPackageSingleRequestResponseModel>>
      requestAskRenovateHouseCustomPackage({
    required AddRenovateHouseCustomPackageRequestBody
        askRenovateHouseCustomPackageRequestBody,
  }) async {
    try {
      final response =
          await _remoteDataSource.requestAskRenovateHouseCustomPackage(
              askRenovateHouseCustomPackageRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error.toString()));
    }
  }

  @override
  Future<ApiResult<RenovateHouseFixedPackageDetailsResponseModel>>
      renovateHouseFixedPackageDetails({required String packageId}) async {
    try {
      final response =
          await _remoteDataSource.renovateHouseFixedPackageDetails(packageId);
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
