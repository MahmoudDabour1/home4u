import 'package:home4u/core/networking/api_result.dart';

import '../../../../core/networking/api_error_handler.dart';
import '../data_source/request_design/request_design_service_remote_data_source.dart';
import '../models/add_request/request_design/add_request_design_request_body.dart';
import '../models/add_request/request_design/request_design_single_request_response_model.dart';
import '../models/ask_requests/request_design_request/request_design_request_response_model.dart';
import '../models/asks/request_design_ask/request_design_asks_response_model.dart';
import '../models/details/request_design_project_details_response_model.dart';

abstract class RequestDesignServicesRepository {
  Future<ApiResult<RequestDesignRequestResponseModel>>
      getAskRequestDesignRequests(
    String askId,
  );

  Future<ApiResult<RequestDesignAsksResponseModel>> getRequestDesignAsks(
    String askId,
  );

  Future<ApiResult<RequestDesignProjectDetailsResponseModel>>
      requestDesignDetails(
    String requestId,
  );

  Future<ApiResult<RequestDesignSingleRequestResponseModel>>
      requestAskRequestDesign(
    AddRequestDesignRequestBody askRequestDesignRequestBody,
  );
}

class RequestDesignServicesRepositoryImpl
    implements RequestDesignServicesRepository {
  final RequestDesignServiceRemoteDataSource _remoteDataSource;

  RequestDesignServicesRepositoryImpl(this._remoteDataSource);

  @override
  Future<ApiResult<RequestDesignRequestResponseModel>>
      getAskRequestDesignRequests(String askId) async {
    try {
      final response =
          await _remoteDataSource.getAskRequestDesignRequests(askId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error.toString()));
    }
  }

  @override
  Future<ApiResult<RequestDesignAsksResponseModel>> getRequestDesignAsks(
      String askId) async {
    try {
      final response = await _remoteDataSource.getRequestDesignAsks(askId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error.toString()));
    }
  }

  @override
  Future<ApiResult<RequestDesignProjectDetailsResponseModel>>
      requestDesignDetails(String requestId) async {
    try {
      final response = await _remoteDataSource.requestDesignDetails(requestId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error.toString()));
    }
  }

  @override
  Future<ApiResult<RequestDesignSingleRequestResponseModel>>
      requestAskRequestDesign(
          AddRequestDesignRequestBody askRequestDesignRequestBody) async {
    try {
      final response = await _remoteDataSource
          .requestAskRequestDesign(askRequestDesignRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error.toString()));
    }
  }
}
