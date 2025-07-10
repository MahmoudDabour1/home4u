import 'package:home4u/core/networking/api_result.dart';
import 'package:home4u/features/products/data/data_source/products_local_data_source.dart';
import 'package:home4u/features/products/data/data_source/products_remote_data_source.dart';
import 'package:home4u/features/products/data/models/delete_product_model.dart';
import 'package:home4u/features/products/data/models/product_preview_response.dart';
import 'package:home4u/features/products/data/models/products_response_model.dart';

import '../../../../core/networking/api_error_handler.dart';

abstract class ProductsRepo {
  Future<ApiResult<ProductsResponseModel>> getProducts(
    Map<String, dynamic> productsFilter,
  );

  Future<ApiResult<DeleteProductModel>> deleteProducts(
    int productId,
  );

  Future<ApiResult<ProductPreviewResponse>> getProductDetails(
    int productId,
  );
}

class ProductsRepoImpl implements ProductsRepo {
  final ProductsRemoteDataSource productsRemoteDataSource;
  final ProductsLocalDatasource productsLocalDataSource;

  ProductsRepoImpl({
    required this.productsLocalDataSource,
    required this.productsRemoteDataSource,
  });

  @override
  Future<ApiResult<ProductsResponseModel>> getProducts(
      Map<String, dynamic> productsFilter) async {
    try {
      final response =
          await productsRemoteDataSource.getProducts(productsFilter);
      await productsLocalDataSource.cacheProductsData(response);
      return ApiResult.success(response);
    } catch (error) {
      final cachedProductsData =
          await productsLocalDataSource.getProductsData();
      if (cachedProductsData != null) {
        return ApiResult.success(cachedProductsData);
      }
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<DeleteProductModel>> deleteProducts(int productId) async {
    try {
      final response = await productsRemoteDataSource.deleteProduct(productId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<ProductPreviewResponse>> getProductDetails(
      int productId) async {
    try {
      final response =
          await productsRemoteDataSource.getProductDetails(productId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
