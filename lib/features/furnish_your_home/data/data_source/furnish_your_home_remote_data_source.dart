import 'package:dio/dio.dart';
import 'package:home4u/features/furnish_your_home/data/models/furnish_your_home_response_model.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../../../core/networking/api_constants.dart';
import '../models/furnish_your_home_request_model.dart';

part 'furnish_your_home_remote_data_source.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class FurnishYourHomeRemoteDataSource {

  factory FurnishYourHomeRemoteDataSource(Dio dio) {
    return _FurnishYourHomeRemoteDataSource(dio);
  }
  @POST(ApiConstants.sendFurnishYourHomeEp)
  Future<FurnishYourHomeResponseModel> addFurnishYourHome(
    @Body() FurnishYourHomeRequestModel furnishYourHomeRequestModel,
  );

}