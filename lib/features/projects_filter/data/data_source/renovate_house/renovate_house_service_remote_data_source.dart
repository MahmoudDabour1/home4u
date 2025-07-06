import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../../../../core/networking/api_constants.dart';
import '../../models/add_request/renovate_house/add_renovate_house_request_body.dart';
import '../../models/add_request/renovate_house/renovate_house_single_request_response_model.dart';
import '../../models/ask_requests/renovate_house_request/renovate_house_request_response_model.dart';
import '../../models/asks/renovate_house_ask/renovate_house_asks_response_model.dart';
import '../../models/details/renovate_house_details_response_model.dart';

part 'renovate_house_service_remote_data_source.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class RenovateHouseServiceRemoteDataSource {
  factory RenovateHouseServiceRemoteDataSource(Dio dio, {String baseUrl}) =
      _RenovateHouseServiceRemoteDataSource;

  @POST(ApiConstants.requestRenovateHouseEp)
  Future<RenovateHouseSingleRequestResponseModel> requestAskRenovateHouse(
    @Body() AddRenovateHouseRequestBody askRenovateHouseRequestBody,
  );

  @GET(ApiConstants.requestRenovateHouseByIdEp)
  Future<RenovateHouseRequestResponseModel> getAskRenovateHouseRequests(
    @Query('askId') String askId,
  );

  @GET(ApiConstants.renovateHouseDetailsEp)
  Future<RenovateHouseDetailsResponseModel> renovateHouseDetails(
    @Path('renovateId') String renovateId,
  );

  @GET(ApiConstants.renovateHouseAsksEp)
  Future<RenovateHouseAsksResponseModel> getRenovateHouseAsks(
    @Query('askId') String askId,
  );
}
