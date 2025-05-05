import 'package:hive/hive.dart';
import 'package:home4u/features/products/data/models/products_response_model.dart';

import '../../../../core/utils/app_constants.dart';
import '../models/business_config_model.dart';

abstract class ProductsLocalDatasource {
  Future<ProductsResponseModel?> getProductsData();

  Future<void> cacheProductsData(ProductsResponseModel productsData);

  Future<BusinessConfigModel> getBusinessConfig();

  Future<void> cacheBusinessConfig(BusinessConfigModel businessConfig);
}

class ProductsLocalDatasourceImpl extends ProductsLocalDatasource {
  final Box<ProductsResponseModel> productsBox =
      Hive.box<ProductsResponseModel>(kProductsBox);

  @override
  Future<void> cacheProductsData(ProductsResponseModel productsData) async {
    await productsBox.put(kProductsData, productsData);
  }

  @override
  Future<ProductsResponseModel?> getProductsData() async {
    return productsBox.get(kProductsData);
  }

  @override
  Future<void> cacheBusinessConfig(BusinessConfigModel businessConfig) async {
    final Box<BusinessConfigModel> businessConfigBox =
        Hive.box<BusinessConfigModel>(kBusinessConfigBox);
    await businessConfigBox.put(kBusinessConfigData, businessConfig);
  }

  @override
  Future<BusinessConfigModel> getBusinessConfig() async {
    final Box<BusinessConfigModel> businessConfigBox =
        Hive.box<BusinessConfigModel>(kBusinessConfigBox);
    final BusinessConfigModel? businessConfig =
        businessConfigBox.get(kBusinessConfigData);
    if (businessConfig != null) {
      return businessConfig;
    } else {
      throw Exception('No Business Config found in local storage');
    }
  }
}
