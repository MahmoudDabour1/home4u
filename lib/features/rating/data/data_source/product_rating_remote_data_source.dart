
import 'package:dio/dio.dart';
import 'package:home4u/features/rating/data/models/update_product_rate_body.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../../../core/networking/api_constants.dart';
import '../models/insert_product_rate_body.dart';
import '../models/product_rate_response_model.dart';

part 'product_rating_remote_data_source.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ProductRatingRemoteDataSource {
  factory  ProductRatingRemoteDataSource(Dio dio, {String baseUrl}) =
      _ProductRatingRemoteDataSource;
  
  
  @POST(ApiConstants.insertProductRateEp)
  Future<ProductRateResponseModel> insertProductRate(
    @Body() InsertProductRateBody body,
  );
  
  @PUT(ApiConstants.insertProductRateEp)
  Future<ProductRateResponseModel> updateProductRate(
    @Body() UpdateProductRateBody body,
  );

  @GET(ApiConstants.findProductRateByProductIdAndUserIdEp)
  Future<ProductRateResponseModel> findProductRateByProductIdAndUserId(
    @Path("productId") int productId,
    @Path("userId") int userId,
  );
}