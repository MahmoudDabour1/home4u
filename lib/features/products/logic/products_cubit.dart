import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home4u/core/helpers/shared_pref_helper.dart';
import 'package:home4u/core/helpers/shared_pref_keys.dart';
import 'package:home4u/core/networking/dio_factory.dart';
import 'package:home4u/core/routing/router_observer.dart';
import 'package:home4u/features/products/data/models/business_config_model.dart';
import 'package:home4u/features/products/data/repos/business_config_repo.dart';
import 'package:home4u/features/products/data/repos/products_repo.dart';
import 'package:home4u/features/products/logic/products_state.dart';

import '../data/data_source/products_local_data_source.dart';
import '../data/models/product_preview_response.dart';
import '../data/models/products_response_model.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final BusinessConfigRepo _businessConfigRepo;

  BusinessConfigModel? businessConfigModel;
  final ProductsRepo _productsRepo;

  final ProductsLocalDatasource _productsLocalDatasource;

  ProductsCubit(
    this._businessConfigRepo,
    this._productsRepo,
    this._productsLocalDatasource,
  ) : super(ProductsState.initial());
  double? minPrice;
  double? maxPrice;
  List<int?> colorsIds = [];
  List<int?> businessTypeIds = [];
  List<int?> materialIds = [];
  bool? isAvailable;
  final searchController = TextEditingController();

  ///pagination
  int _page = 0;
  bool hasReachedMax = false;
  List<Content> products = [];
  bool isFetching = false;

  /// Counter for function calls
  int _getProductsCallCount = 0;

  static ProductsCubit get(context) => BlocProvider.of(context);

  List<ProductBaseUnit> baseUnits = [];
  List<FilterColor> colors = [];
  List<ProductMaterial> materials = [];
  ProductPreviewResponse? productPreviewResponse; // Add this

  Future<void> getProducts({bool isRefresh = false}) async {
    final int userBusinessId =
        await SharedPrefHelper.getInt(SharedPrefKeys.userTypeId);

    final String userBusinessTypeId =
        await SharedPrefHelper.getString(SharedPrefKeys.userBusinessTypeId);

    log("userBusinessId: $userBusinessId");

    if (isFetching) return;
    isFetching = true;

    if (!isRefresh && hasReachedMax) {
      isFetching = false;
      return;
    }

    if (isRefresh) {
      _page = 0;
      hasReachedMax = false;
      products.clear();
    } else if (_page > 0) {
      emit(ProductsState.paginationLoading());
    } else {
      emit(ProductsState.getProductsLoading());
    }

    final requestBody = {
      "pageNumber": _page,
      "searchCriteria": {
        "businessId": int.parse(userBusinessTypeId),
        "minPrice": minPrice,
        "maxPrice": maxPrice,
        "colorsIds": colorsIds.isEmpty ? null : colorsIds,
        "businessTypeIds": businessTypeIds.isEmpty ? null : businessTypeIds,
        "inStock": isAvailable ?? false,
        "name": searchController.text.isEmpty ? null : searchController.text,
        "materialIds": materialIds.isEmpty ? null : materialIds,
      }
    };
    DioFactory.setContentType("application/json");

    final response = await _productsRepo.getProducts(requestBody);

    response.when(success: (data) async {
      await _productsLocalDatasource.cacheProductsData(data);

      final newProducts = data.data?.content ?? [];
      if (newProducts.isEmpty) {
        hasReachedMax = true;
      } else {
        products.addAll(newProducts);
        _page++;
        hasReachedMax = _page >= (data.data?.totalPages ?? 1);
      }
      if (!isClosed) {
        emit(
          ProductsState.getProductsSuccess(data),
        );

        _getProductsCallCount++;
        logger.e("getProducts called $_getProductsCallCount times");
      }
    }, failure: (error) {
      if (!isClosed) {
        emit(ProductsState.getProductsFailure(
          errorMessage: error.message.toString(),
        ));
      }
    });
    isFetching = false;
  }

  Future<void> deleteProduct(int productId) async {
    final response = await _productsRepo.deleteProducts(productId);
    response.when(
      success: (data) {
        if (!isClosed) {
          products.removeWhere((product) => product.id == productId);
          emit(ProductsState.deleteProductSuccess(data));
        }
      },
      failure: (error) {
        if (!isClosed) {
          emit(ProductsState.deleteProductFailure(
            errorMessage: error.message.toString(),
          ));
        }
      },
    );
  }

  Future<void> getProductById(int productId) async {
    emit(const ProductsState.getProductPreviewLoading());
    final response = await _productsRepo.getProductDetails(productId);
    response.when(
      success: (product) {
        productPreviewResponse = product;
        if (!isClosed) {
          emit(ProductsState.getProductPreviewSuccess(product));
        }
        return product;
      },
      failure: (error) {
        logger.e("getProductById failed: ${error.message}", error: error);
        if (!isClosed) {
          emit(ProductsState.getProductPreviewFailure(
              errorMessage: error.message.toString()));
        }
      },
    );
  }

  Future<void> getBusinessConfig() async {
    emit(const ProductsState.businessConfigLoading());

    DioFactory.setContentType("application/json");
    final response = await _businessConfigRepo.getBusinessConfig();
    response.when(
      success: (data) {
        businessConfigModel = data;
        if (!isClosed) {
          emit(ProductsState.businessConfigSuccess(data));
          colors = data.data?.colors ?? [];
          baseUnits = data.data?.productBaseUnits ?? [];
          materials = data.data?.productMaterial ?? [];
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

  void resetPagination() {
    _page = 0;
    _getProductsCallCount = 0;
    hasReachedMax = false;
    products.clear();
  }

  @override
  Future<void> close() {
    resetPagination();
    return super.close();
  }
}

Future<Map<String, dynamic>> _productsFilterJson(
  double? minPrice,
  double? maxPrice,
  List<int>? colorsIds,
  List<int>? businessTypeIds,
) async {
  return {
    "searchCriteria": {
      "businessId": 12,
      "minPrice": minPrice,
      "maxPrice": maxPrice,
      "colorsIds": colorsIds,
      "businessTypeIds": businessTypeIds,
    }
  };
}
