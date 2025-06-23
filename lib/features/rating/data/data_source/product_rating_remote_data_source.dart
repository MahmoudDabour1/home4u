
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../../../core/networking/api_constants.dart';
import '../models/insert_product_rate_body.dart';
import '../models/insert_product_rate_response_model.dart';

part 'product_rating_remote_data_source.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ProductRatingRemoteDataSource {
  factory  ProductRatingRemoteDataSource(Dio dio, {String baseUrl}) =
      _ProductRatingRemoteDataSource;
  
  
  @POST(ApiConstants.insertProductRateEp)
  Future<InsertProductRateResponseModel> insertProductRate(
    @Body() InsertProductRateBody body,
  );
}