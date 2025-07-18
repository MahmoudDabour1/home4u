import 'package:home4u/features/products/data/data_source/products_local_data_source.dart';
import 'package:home4u/features/products/data/data_source/products_remote_data_source.dart';

import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../models/business_config_model.dart';

abstract class BusinessConfigRepo {
  Future<ApiResult<BusinessConfigModel>> getBusinessConfig( {bool forceRefresh = false});
}

class BusinessConfigRepoImpl implements BusinessConfigRepo {
  final ProductsRemoteDataSource remoteDataSource;
  final ProductsLocalDatasource localDatasource;
  String? _currentLanguage;

  BusinessConfigRepoImpl({
    required this.remoteDataSource,
    required this.localDatasource,
  });

  @override
  Future<ApiResult<BusinessConfigModel>> getBusinessConfig(
      {bool forceRefresh = false}) async {
    try {
      if (forceRefresh) {
        throw Exception('Force refresh requested');
      }
      final cachedData = await localDatasource.getBusinessConfig();
      return ApiResult.success(cachedData);
    } catch (_) {
      try {
        final response = await remoteDataSource.getBusinessConfig();
        await localDatasource.cacheBusinessConfig(response);
        return ApiResult.success(response);
      } catch (error) {
        return ApiResult.failure(ApiErrorHandler.handle(error));
      }
    }
  }
}
