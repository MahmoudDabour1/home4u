import 'package:dio/dio.dart';
import 'package:home4u/core/networking/api_constants.dart';
import 'package:home4u/features/projects_filter/data/models/asks/technical_asks_response_model.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'asks_remote_data_source.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class AsksRemoteDataSource {
  factory AsksRemoteDataSource(Dio dio, {String baseUrl}) = _AsksRemoteDataSource;

  @GET(ApiConstants.technicalAsksEp)
  Future<TechnicalAsksResponseModel> getTechnicalAsks(
    @Query('askId') String askId,
  );
}
