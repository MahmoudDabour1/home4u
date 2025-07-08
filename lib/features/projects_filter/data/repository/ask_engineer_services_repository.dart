import 'package:home4u/core/networking/api_result.dart';

import '../../../../core/networking/api_error_handler.dart';
import '../data_source/ask_engineer/ask_engineer_service_remote_data_source.dart';
import '../models/add_request/ask_engineer/add_ask_engineer_request_body.dart';
import '../models/add_request/ask_engineer/ask_engineer_single_request_response_model.dart';
import '../models/ask_requests/ask_engineer_request/ask_engineer_request_response_model.dart';
import '../models/asks/engineer_ask/engineer_asks_response_model.dart';
import '../models/details/ask_engineer_project_details_response_model.dart';

abstract class AskEngineerServicesRepository {
  Future<ApiResult<AskEngineerSingleRequestResponseModel>> requestAskEngineer(
    AddAskEngineerRequestBody askEngineerRequestBody,
  );

  Future<ApiResult<AskEngineerProjectDetailsResponseModel>>
      askEngineerServiceDetails(
    String askId,
  );

  Future<ApiResult<EngineerAsksResponseModel>> getEngineerAsks(
    String askId,
  );

  Future<ApiResult<AskEngineerRequestResponseModel>> getAskEngineerRequests(
    String askId,
  );
}

class AskEngineerServicesRepositoryImpl implements AskEngineerServicesRepository {
  final AskEngineerServiceRemoteDataSource _remoteDataSource;

  AskEngineerServicesRepositoryImpl(this._remoteDataSource);

  @override
  Future<ApiResult<AskEngineerProjectDetailsResponseModel>>
      askEngineerServiceDetails(String askId) async {
    try {
      final response = await _remoteDataSource.askEngineerServiceDetails(askId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error.toString()));
    }
  }

  @override
  Future<ApiResult<EngineerAsksResponseModel>> getEngineerAsks(
      String askId) async {
    try {
      final response = await _remoteDataSource.getEngineerAsks(askId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error.toString()));
    }
  }

  @override
  Future<ApiResult<AskEngineerSingleRequestResponseModel>> requestAskEngineer(
      AddAskEngineerRequestBody askEngineerRequestBody) async {
    try {
      final response =
          await _remoteDataSource.requestAskEngineer(askEngineerRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error.toString()));
    }
  }

  @override
  Future<ApiResult<AskEngineerRequestResponseModel>> getAskEngineerRequests(String askId)async {
   try{
      final response = await _remoteDataSource.getAskEngineerRequests(askId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error.toString()));
   }
  }
}
