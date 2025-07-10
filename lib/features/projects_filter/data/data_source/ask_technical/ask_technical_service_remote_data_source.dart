import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../../../../core/networking/api_constants.dart';
import '../../models/add_request/ask_technical/add_ask_technical_request_body.dart';
import '../../models/add_request/ask_technical/ask_technical_single_request_response_model.dart';
import '../../models/ask_requests/ask_technical_request/ask_technical_request_response_model.dart';
import '../../models/asks/technical_asks_response_model.dart';
import '../../models/details/ask_technical_project_details_response_model.dart';

part 'ask_technical_service_remote_data_source.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class AskTechnicalServiceRemoteDataSource {
  factory AskTechnicalServiceRemoteDataSource(Dio dio, {String baseUrl}) =
      _AskTechnicalServiceRemoteDataSource;

  @POST(ApiConstants.requestAskWorkerEp)
  Future<AskTechnicalSingleRequestResponseModel> requestAskTechnical(
    @Body() AddAskTechnicalRequestBody askTechnicalRequestBody,
  );

  @GET(ApiConstants.requestAskWorkerByIdEp)
  Future<AskTechnicalRequestResponseModel> getAskTechnicalRequests(
    @Query('askId') String askId,
  );

  @GET(ApiConstants.technicalAsksEp)
  Future<TechnicalAsksResponseModel> getTechnicalAsks(
    @Query('askId') String askId,
  );

  @GET(ApiConstants.askTechnicalServiceDetailsEp)
  Future<AskTechnicalProjectDetailsResponseModel> askTechnicalServiceDetails(
    @Path('askId') String askId,
  );
}
