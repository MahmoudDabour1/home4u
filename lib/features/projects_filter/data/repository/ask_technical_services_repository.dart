import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../data_source/ask_technical/ask_technical_service_remote_data_source.dart';
import '../models/add_request/ask_technical/add_ask_technical_request_body.dart';
import '../models/add_request/ask_technical/ask_technical_single_request_response_model.dart';
import '../models/ask_requests/ask_technical_request/ask_technical_request_response_model.dart';
import '../models/asks/technical_asks_response_model.dart';
import '../models/details/ask_technical_project_details_response_model.dart';

abstract class AskTechnicalServicesRepository {
  Future<ApiResult<AskTechnicalSingleRequestResponseModel>>
      requestAskTechnical({
    required AddAskTechnicalRequestBody askTechnicalRequestBody,
  });

  Future<ApiResult<AskTechnicalRequestResponseModel>> getAskTechnicalRequests({
    required String askId,
  });

  Future<ApiResult<TechnicalAsksResponseModel>> getTechnicalAsks({
    required String askId,
  });

  Future<ApiResult<AskTechnicalProjectDetailsResponseModel>>
      askTechnicalServiceDetails({
    required String askId,
  });
}

class AskTechnicalServicesRepositoryImpl implements AskTechnicalServicesRepository {
  final AskTechnicalServiceRemoteDataSource _remoteDataSource;

  AskTechnicalServicesRepositoryImpl(this._remoteDataSource);

  @override
  Future<ApiResult<AskTechnicalSingleRequestResponseModel>>
      requestAskTechnical({
    required AddAskTechnicalRequestBody askTechnicalRequestBody,
  }) async {
    try {
      final response =
          await _remoteDataSource.requestAskTechnical(askTechnicalRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error.toString()));
    }
  }

  @override
  Future<ApiResult<AskTechnicalProjectDetailsResponseModel>>
      askTechnicalServiceDetails({
    required String askId,
  }) async {
    try {
      final response =
          await _remoteDataSource.askTechnicalServiceDetails(askId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error.toString()));
    }
  }

  @override
  Future<ApiResult<TechnicalAsksResponseModel>> getTechnicalAsks({
    required String askId,
  }) async {
    try {
      final response = await _remoteDataSource.getTechnicalAsks(askId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error.toString()));
    }
  }

  @override
  Future<ApiResult<AskTechnicalRequestResponseModel>> getAskTechnicalRequests({
    required String askId,
  }) async {
    try {
      final response = await _remoteDataSource.getAskTechnicalRequests(askId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error.toString()));
    }
  }
}
