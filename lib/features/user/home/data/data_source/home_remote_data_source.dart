import 'package:dio/dio.dart';
import 'package:home4u/features/user/home/data/models/highest_rated_response_model.dart';
import 'package:home4u/features/user/home/data/models/recommended_for_you_response_model.dart';
import 'package:home4u/features/user/home/data/models/top_best_seller_response_model.dart';
import 'package:home4u/features/user/home/data/models/top_engineers_response_model.dart';
import 'package:home4u/features/user/home/data/models/top_workers_response_model.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../../../../core/networking/api_constants.dart';

part 'home_remote_data_source.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class HomeRemoteDataSource {
  factory HomeRemoteDataSource(Dio dio, {String baseUrl}) =
      _HomeRemoteDataSource;

  @GET(ApiConstants.topBestSellerEp)
  Future<TopBestSellerResponseModel> getTopBestSeller();

  @GET(ApiConstants.highestRatedEp)
  Future<HighestRatedResponseModel> getHighestRated();

  @GET(ApiConstants.recommendedForYouEp)
  Future<RecommendedForYouResponseModel> getRecommendedForYou(
    @Path("userId") int userId,
  );

  @GET(ApiConstants.topEngineersEp)
  Future<TopEngineersResponseModel> getTopEngineers();

  @GET(ApiConstants.topWorkersEp)
  Future<TopWorkersResponseModel> getTopWorkers();
}
