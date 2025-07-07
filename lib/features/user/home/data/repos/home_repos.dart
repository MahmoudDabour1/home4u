import 'package:home4u/core/networking/api_error_handler.dart';
import 'package:home4u/core/networking/api_result.dart';
import 'package:home4u/features/user/home/data/models/highest_rated_response_model.dart';
import 'package:home4u/features/user/home/data/models/recommended_for_you_response_model.dart';
import 'package:home4u/features/user/home/data/models/top_best_seller_response_model.dart';
import 'package:home4u/features/user/home/data/models/top_workers_response_model.dart';

import '../data_source/home_remote_data_source.dart';
import '../models/top_engineers_response_model.dart';

abstract class HomeRepos {
  Future<ApiResult<TopBestSellerResponseModel>> getTopBestSeller();

  Future<ApiResult<HighestRatedResponseModel>> getHighestRated();

  Future<ApiResult<RecommendedForYouResponseModel>> getRecommendedForYou(
      int userId);

  Future<ApiResult<TopEngineersResponseModel>> getTopEngineers();

  Future<ApiResult<TopWorkersResponseModel>> getTopWorkers();
}

class HomeReposImpl implements HomeRepos {
  final HomeRemoteDataSource _remoteDataSource;

  HomeReposImpl(this._remoteDataSource);

  @override
  Future<ApiResult<TopBestSellerResponseModel>> getTopBestSeller() async {
    try {
      final response = await _remoteDataSource.getTopBestSeller();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e.toString()));
    }
  }

  @override
  Future<ApiResult<HighestRatedResponseModel>> getHighestRated() async {
    try {
      final response = await _remoteDataSource.getHighestRated();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e.toString()));
    }
  }

  @override
  Future<ApiResult<RecommendedForYouResponseModel>> getRecommendedForYou(
      int userId) async {
    try {
      final response = await _remoteDataSource.getRecommendedForYou(userId);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e.toString()));
    }
  }

  @override
  Future<ApiResult<TopEngineersResponseModel>> getTopEngineers() async {
    try {
      final response = await _remoteDataSource.getTopEngineers();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e.toString()));
    }
  }

  @override
  Future<ApiResult<TopWorkersResponseModel>> getTopWorkers() async {
    try {
      final response = await _remoteDataSource.getTopWorkers();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e.toString()));
    }
  }
}
