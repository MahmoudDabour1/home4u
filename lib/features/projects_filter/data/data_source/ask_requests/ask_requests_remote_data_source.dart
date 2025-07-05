import 'package:dio/dio.dart';
import 'package:home4u/features/projects_filter/data/models/ask_requests/renovate_house_request/renovate_house_request_response_model.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../../../../core/networking/api_constants.dart';
import '../../models/ask_requests/ask_engineer_request/ask_engineer_request_response_model.dart';
import '../../models/ask_requests/ask_technical_request/ask_technical_request_response_model.dart';
import '../../models/ask_requests/renovate_house_custom_package_request/renovate_house_custom_package_request_response_model.dart';
import '../../models/ask_requests/request_design_request/request_design_request_response_model.dart';

part 'ask_requests_remote_data_source.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class AskRequestsRemoteDataSource {
  factory AskRequestsRemoteDataSource(Dio dio, {String baseUrl}) =
      _AskRequestsRemoteDataSource;

  @GET(ApiConstants.requestAskEngineerByIdEp)
  Future<AskEngineerRequestResponseModel> getAskEngineerRequests(
    @Query('askId') String askId,
  );

  @GET(ApiConstants.requestAskWorkerByIdEp)
  Future<AskTechnicalRequestResponseModel> getAskTechnicalRequests(
    @Query('askId') String askId,
  );

  @GET(ApiConstants.requestRenovateHouseByIdEp)
  Future<RenovateHouseRequestResponseModel> getAskRenovateHouseRequests(
    @Query('askId') String askId,
  );

  @GET(ApiConstants.requestRenovateHouseCustomPackageByIdEp)
  Future<RenovateHouseCustomPackageRequestResponseModel>
      getAskRenovateHouseCustomPackageRequests(
    @Query('askId') String askId,
  );

  @GET(ApiConstants.requestRequestDesignByIdEp)
  Future<RequestDesignRequestResponseModel> getAskRequestDesignRequests(
    @Query('askId') String askId,
  );
}
