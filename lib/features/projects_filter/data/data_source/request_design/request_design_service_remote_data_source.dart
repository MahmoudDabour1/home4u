import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../../../../core/networking/api_constants.dart';
import '../../models/add_request/request_design/add_request_design_request_body.dart';
import '../../models/add_request/request_design/request_design_single_request_response_model.dart';
import '../../models/ask_requests/request_design_request/request_design_request_response_model.dart';
import '../../models/asks/request_design_ask/request_design_asks_response_model.dart';
import '../../models/details/request_design_project_details_response_model.dart';

part 'request_design_service_remote_data_source.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class RequestDesignServiceRemoteDataSource {
  factory RequestDesignServiceRemoteDataSource(Dio dio, {String baseUrl}) =
      _RequestDesignServiceRemoteDataSource;

  @GET(ApiConstants.requestRequestDesignByIdEp)
  Future<RequestDesignRequestResponseModel> getAskRequestDesignRequests(
    @Query('askId') String askId,
  );


  @GET(ApiConstants.requestDesignAsksEp)
  Future<RequestDesignAsksResponseModel> getRequestDesignAsks(
    @Query('askId') String askId,
  );

  @GET(ApiConstants.requestDesignDetailsEp)
  Future<RequestDesignProjectDetailsResponseModel> requestDesignDetails(
    @Path('requestId') String requestId,
  );

  @POST(ApiConstants.requestRequestDesignEp)
  Future<RequestDesignSingleRequestResponseModel> requestAskRequestDesign(
    @Body() AddRequestDesignRequestBody askRequestDesignRequestBody,
  );
}
