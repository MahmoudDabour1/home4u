import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home4u/features/products/data/models/business_config_model.dart';
import 'package:home4u/features/products/data/repos/business_config_repo.dart';
import 'package:home4u/features/products/data/repos/products_repo.dart';
import 'package:home4u/features/products/logic/products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final BusinessConfigRepo _businessConfigRepo;

  BusinessConfigModel? businessConfigModel;
  final ProductsRepo _productsRepo;

  ProductsCubit(this._businessConfigRepo, this._productsRepo)
      : super(ProductsState.initial());
  double? minPrice;
  double? maxPrice;
  List<int> colorsIds = [];
  List<int> businessTypeIds = [];

  static ProductsCubit get(context) => BlocProvider.of(context);

  List<ProductMaterial> baseUnits = [];
  List<FilterColor> colors = [];

  Future<void> getBusinessConfig() async {
    emit(const ProductsState.businessConfigLoading());
    final response = await _businessConfigRepo.getBusinessConfig();
    response.when(
      success: (data) {
        businessConfigModel = data;
        if (!isClosed) {
          emit(ProductsState.businessConfigSuccess(data));
        }
      },
      failure: (error) {
        if (!isClosed) {
          emit(ProductsState.businessConfigFailure(
              errorMessage: error.message.toString()));
          emit(ProductsState.businessConfigFailure(
              errorMessage: error.message.toString()));
        }
      },
    );
  }

  Future<void> getProducts() async {
    emit(ProductsState.getProductsLoading());

    final requestBody = {
      "searchCriteria": {
        "businessId": 12,
        "minPrice": minPrice,
        "maxPrice": maxPrice,
        "colorsIds": colorsIds.isEmpty ? null : colorsIds,
        "businessTypeIds": businessTypeIds.isEmpty ? null : businessTypeIds,
      }
    };
    final response = await _productsRepo.getProducts(requestBody);
    response.when(
      success: (data) {
        if (!isClosed) {
          emit(ProductsState.getProductsSuccess(data));
        }
      },
      failure: (error) {
        if (!isClosed) {
          emit(ProductsState.getProductsFailure(
              errorMessage: error.message.toString()));
        }
      },
    );
  }

  Future<void> deleteProduct(int productId) async {
    final response = await _productsRepo.deleteProducts(productId);
    response.when(
      success: (data) {
        if (!isClosed) {
          emit(ProductsState.deleteProductSuccess(data));
          getProducts();
        }
      },
      failure: (error) {
        if (!isClosed) {
          emit(ProductsState.deleteProductFailure(
              errorMessage: error.message.toString()));
        }
      },
    );
  }
}

// Future<Map<String, dynamic>> _productsFilterJson(
//   double? minPrice,
//   double? maxPrice,
//   List<int>? colorsIds,
//   List<int>? businessTypeIds,
// ) async {
//   return {
//     "searchCriteria": {
//       "businessId": 12,
//       "minPrice": minPrice,
//       "maxPrice": maxPrice,
//       "colorsIds": colorsIds,
//       "businessTypeIds": businessTypeIds,
//     }
//   };
// }
