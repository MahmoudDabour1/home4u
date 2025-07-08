import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../../../../core/networking/api_constants.dart';
import '../../models/add_request/ask_engineer/add_ask_engineer_request_body.dart';
import '../../models/add_request/ask_engineer/ask_engineer_single_request_response_model.dart';
import '../../models/ask_requests/ask_engineer_request/ask_engineer_request_response_model.dart';
import '../../models/asks/engineer_ask/engineer_asks_response_model.dart';
import '../../models/details/ask_engineer_project_details_response_model.dart';

part 'ask_engineer_service_remote_data_source.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class AskEngineerServiceRemoteDataSource {
  factory AskEngineerServiceRemoteDataSource(Dio dio, {String baseUrl}) =
      _AskEngineerServiceRemoteDataSource;

  @POST(ApiConstants.requestAskEngineerEp)
  Future<AskEngineerSingleRequestResponseModel> requestAskEngineer(
    @Body() AddAskEngineerRequestBody askEngineerRequestBody,
  );

  @GET(ApiConstants.askEngineerServiceDetailsEp)
  Future<AskEngineerProjectDetailsResponseModel> askEngineerServiceDetails(
    @Path('askId') String askId,
  );

  @GET(ApiConstants.engineerAsksEp)
  Future<EngineerAsksResponseModel> getEngineerAsks(
    @Query('askId') String askId,
  );

  @GET(ApiConstants.requestAskEngineerByIdEp)
  Future<AskEngineerRequestResponseModel> getAskEngineerRequests(
    @Query('askId') String askId,
  );
}
