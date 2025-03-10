import 'package:dio/dio.dart';
import 'package:home4u/features/products/data/models/delete_product_model.dart';
import 'package:home4u/features/products/data/models/product_preview_response.dart';
import 'package:home4u/features/products/data/models/products_response_model.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../../../core/networking/api_constants.dart';
import '../models/business_config_model.dart';

part 'products_remote_data_source.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ProductsRemoteDataSource {
  factory ProductsRemoteDataSource(Dio dio, {String baseUrl}) =
      _ProductsRemoteDataSource;

  @GET(ApiConstants.businessConfigEP)
  Future<BusinessConfigModel> getBusinessConfig();

  @POST(ApiConstants.productsFilterEP)
  Future<ProductsResponseModel> getProducts(
    @Body() Map<String, dynamic> productsFilter,
  );

  @DELETE(ApiConstants.deleteProductEP)
  Future<DeleteProductModel> deleteProduct(
    @Path('productId') int productId,
  );

  @GET(ApiConstants.getProductDetailsEP)
  Future<ProductPreviewResponse> getProductDetails(
    @Path('productId') int productId,
  );
}
