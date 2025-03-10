import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../../../core/networking/api_constants.dart';
import '../models/add_product_business_response_model.dart';
import '../models/business_add_product_body.dart';
import '../models/business_add_product_images_body.dart';
import '../models/business_add_product_images_response.dart';
import '../models/upload_image_response.dart';

part 'business_add_product_remote_data_source.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class BusinessAddProductRemoteDataSource {
  factory BusinessAddProductRemoteDataSource(Dio dio, {String baseUrl}) =
  _BusinessAddProductRemoteDataSource;

  @POST(ApiConstants.addProductEp)
  Future<AddProductBusinessResponseModel> addBusinessProduct(
      @Body() BusinessAddProductBody businessAddProductBody,
      );

  @POST(ApiConstants.addAllProductImagesEp)
  Future<BusinessAddProductImagesResponse> addBusinessProductImage(
      @Body() List<BusinessAddProductImagesBody> imagesBody,
      );

  //{{prod_url}}/api/v1/file?pathId=BUSINESS_PRODUCTS&id=9
  @MultiPart()
  @POST("/api/v1/file")
  Future<UploadImageResponse> uploadBusinessImage(
      @Query("pathId") String pathId,
      @Query("id") int id,
      @Body() FormData image,
      );
}
