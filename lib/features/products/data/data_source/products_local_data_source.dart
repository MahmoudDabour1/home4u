import 'package:hive/hive.dart';
import 'package:home4u/features/products/data/models/products_response_model.dart';

import '../../../../core/utils/app_constants.dart';

abstract class ProductsLocalDatasource {
  Future<ProductsResponseModel?> getProductsData();

  Future<void> cacheProductsData(ProductsResponseModel productsData);
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
}
