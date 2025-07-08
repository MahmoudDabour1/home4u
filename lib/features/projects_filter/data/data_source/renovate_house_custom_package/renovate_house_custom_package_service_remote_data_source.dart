import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../../../../core/networking/api_constants.dart';
import '../../models/add_request/renovate_house_custom_package/add_renovate_house_custom_package_request_body.dart';
import '../../models/add_request/renovate_house_custom_package/renovate_house_custom_package_single_request_response_model.dart';
import '../../models/ask_requests/renovate_house_custom_package_request/renovate_house_custom_package_request_response_model.dart';
import '../../models/asks/renovate_house_custom_package_ask/renovate_house_custom_package_asks_response_model.dart';
import '../../models/details/renovate_house_fixed_package_details_response_model.dart';

part 'renovate_house_custom_package_service_remote_data_source.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class RenovateHouseCustomPackageServiceRemoteDataSource {
  factory RenovateHouseCustomPackageServiceRemoteDataSource(Dio dio,
      {String baseUrl}) = _RenovateHouseCustomPackageServiceRemoteDataSource;

  @GET(ApiConstants.requestRenovateHouseCustomPackageByIdEp)
  Future<RenovateHouseCustomPackageRequestResponseModel>
      getAskRenovateHouseCustomPackageRequests(
    @Query('askId') String askId,
  );

  @POST(ApiConstants.requestRenovateHouseCustomPackageEp)
  Future<RenovateHouseCustomPackageSingleRequestResponseModel>
      requestAskRenovateHouseCustomPackage(
    @Body()
    AddRenovateHouseCustomPackageRequestBody
        askRenovateHouseCustomPackageRequestBody,
  );

  @GET(ApiConstants.renovateHouseFixedPackageAsksEp)
  Future<RenovateHouseCustomPackageAsksResponseModel>
      getRenovateHouseCustomPackageAsks(
    @Query('askId') String askId,
  );

  @GET(ApiConstants.renovateHouseFixedPackageDetailsEp)
  Future<RenovateHouseFixedPackageDetailsResponseModel>
      renovateHouseFixedPackageDetails(
    @Path('packageId') String packageId,
  );
}
