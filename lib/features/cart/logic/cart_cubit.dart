import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:home4u/features/cart/data/models/cart_item_model.dart';
import 'package:home4u/features/cart/data/models/shop_now_search_body.dart';

import '../../../core/routing/router_observer.dart';
import '../../products/data/models/business_config_model.dart';
import '../data/models/order_details_body.dart';
import '../data/models/rating_reviews_request_model.dart';
import '../data/models/shop_now_response_model.dart';
import '../data/repository/cart_repository.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepository cartRepository;
  BusinessConfigModel? businessConfigModel;

  CartCubit(this.cartRepository) : super(const CartState.initial());

  ///resolve filter
  List<String>? selectedBusinessTypeNames = [];
  List<String>? selectedMaterialNames = [];
  List<String>? selectedColorNames = [];
  double? minPrice;
  double? maxPrice;
  List<int?>? materialIds = [];
  List<int?>? colorsIds = [];
  List<int?> businessTypeIds = [];
  bool? isAvailable;
  final searchController = TextEditingController();
  int? selectedBusinessType;
  int? selectedBusinessTypeCategory;

  ///pagination
  int _page = 0;
  bool hasReachedMax = false;
  List<ShopNowContent> products = [];
  bool isFetching = false;

  /// Counter for function calls
  int _getProductsCallCount = 0;

  Future<void> getCartProducts({bool isRefresh = false}) async {
    if (isFetching) return;
    isFetching = true;

    if (!isRefresh && hasReachedMax) {
      isFetching = false;
      return;
    }

    if (isRefresh) {
      _page = 0;
      hasReachedMax = false;
      products = [];
    } else if (_page > 0) {
      emit(const CartState.paginationLoading());
    } else {
      emit(const CartState.shopNowLoading());
    }

    ShopNowSearchBody shopNowSearchBody = ShopNowSearchBody(
      pageNumber: _page,
      pageSize: 10,
      searchCriteria: ShopNowSearchCriteria(
        name: searchController.text,
        businessTypeId: selectedBusinessType,
        businessTypeCategoryId: selectedBusinessTypeCategory,
        minPrice: minPrice,
        maxPrice: maxPrice,
        colorIds: (colorsIds == null || colorsIds!.isEmpty) ? null : colorsIds,
        materialIds:
            (materialIds == null || materialIds!.isEmpty) ? null : materialIds,
      ),
    );

    logger.w(
      "getProducts: ${shopNowSearchBody.toJson().toString()} \n selected BusinessType: $selectedBusinessType \n selectedBusinessTypeCategory: $selectedBusinessTypeCategory \n minPrice: $minPrice \n maxPrice: $maxPrice \n colorsIds: $colorsIds \n materialIds: $materialIds",
    );

    final response = await cartRepository.shopNow(
      shopNowSearchBody,
    );

    response.when(success: (data) async {
      final newProducts = data.data?.content ?? [];
      if (newProducts.isNotEmpty) {
        products.addAll(newProducts);
        _page++;
        hasReachedMax = _page >= (data.data?.totalPages ?? 1);
      } else {
        hasReachedMax = true;
      }

      if (!isClosed) {
        emit(CartState.shopNowSuccess(data));
      }

      _getProductsCallCount++;
      logger.w(
        "getProducts call count: $_getProductsCallCount",
      );
    }, failure: (error) {
      if (!isClosed) {
        emit(CartState.shopNowFailure(
          error: error.message.toString(),
        ));
      }
    });
    isFetching = false;
  }

  Future<void> refreshCart() async {
    emit(const CartState.cartLoading());
    await getCartProducts(isRefresh: true);
    if (_cartItems.isNotEmpty) {
      emit(CartState.cartSuccess(List.from(_cartItems)));
    } else {
      emit(const CartState.cartEmpty());
    }
  }

  /// Reset all filters
  Future<void> resetAllFilters() async {
    selectedBusinessTypeNames = [];
    selectedMaterialNames = [];
    selectedColorNames = [];
    minPrice = null;
    maxPrice = null;
    colorsIds = [];
    businessTypeIds = [];
    materialIds = [];
    isAvailable = null;
    searchController.clear();
    selectedBusinessType = null;
    selectedBusinessTypeCategory = null;

    /// Reset pagination
    _page = 0;
    hasReachedMax = false;
    products = [];

    emit(const CartState.resetFilter());
    if (_cartItems.isNotEmpty) {
      emit(CartState.cartSuccess(List.from(_cartItems)));
    }
  }

  Future<void> resetPagination() async {
    _page = 0;
    hasReachedMax = false;
    products = [];
  }

  ///ToDo :
  ///filter badge count
  int getActiveFilterCount() {
    int count = 0;

    if ((selectedBusinessType ?? -1) != -1) count++;
    if ((selectedBusinessTypeCategory ?? -1) != -1) count++;
    if (minPrice != null || maxPrice != null) count++;
    if (colorsIds != null && colorsIds!.isNotEmpty) count++;
    if (materialIds != null && materialIds!.isNotEmpty) count++;
    if (isAvailable != null) count++;

    return count;
  }

  ///cart functionality
  /// Cart functionality - manages all cart operations
  final List<CartItemModel> _cartItems = [];

  void addToCart(ShopNowContent product) {
    final index =
        _cartItems.indexWhere((item) => item.product.id == product.id);

    if (index != -1) {
      _cartItems[index] =
          _cartItems[index].copyWith(quantity: _cartItems[index].quantity + 1);
    } else {
      _cartItems.add(CartItemModel(
        product: product,
        quantity: 1,
      ));
    }
    emit(CartState.cartSuccess(List.from(_cartItems)));
  }

  void removeFromCart(ShopNowContent cartItem) {
    final initialCount = _cartItems.length;
    _cartItems.removeWhere((item) => item.product.id == cartItem.id);
    logger
        .e("Removed item. Before: $initialCount, After: ${_cartItems.length}");
    if (initialCount != _cartItems.length) {
      emit(CartState.cartSuccess(List.from(_cartItems)));
    }
  }

  void updateQuantity(ShopNowContent product, int quantity) {
    final index =
        _cartItems.indexWhere((item) => item.product.id == product.id);

    if (index != -1) {
      if (quantity > 0) {
        _cartItems[index] = _cartItems[index].copyWith(quantity: quantity);
      } else {
        _cartItems.removeAt(index);
      }
    } else if (quantity > 0) {
      _cartItems.add(CartItemModel(
        product: product,
        quantity: quantity,
      ));
    }

    if (index != -1 || quantity > 0) {
      emit(CartState.cartSuccess(List.from(_cartItems)));
    }
  }

  int getCartCount() => _cartItems.fold(0, (sum, item) => sum + item.quantity);

  List<CartItemModel> getCartItems() => List.unmodifiable(_cartItems);

  ///insert order details
  Future<void> insertOrderDetails() async {
    emit(const CartState.insertOrderLoading());
    final orderDetailsBody = OrderDetailsBody(
      totalPrice: _cartItems.fold(0.0,
          (sum, item) => sum! + ((item.product.price ?? 0.0) * item.quantity)),
      orderDetails: _cartItems
          .map((item) => OrderDetails(
                productId: item.product.id,
                price: (item.product.price ?? 0.0).toDouble(),
                amount: item.quantity,
              ))
          .toList(),
    );

    final response = await cartRepository.insertOrder(orderDetailsBody);

    response.when(success: (data) {
      emit(CartState.insertOrderSuccess(data));
      logger.w("Insert Order Success: ${data.toJson()}");
      _cartItems.clear();
      // emit(CartState.cartSuccess([]));
    }, failure: (error) {
      emit(CartState.insertOrderFailure(error: error.message.toString()));
    });
  }

  Future<void> getProductRate(int productId) async {
    emit(const CartState.productRateLoading());
    final response = await cartRepository.getProductRate(productId);

    response.when(success: (data) {
      emit(CartState.productRateSuccess(data));
      logger.w("Get Product Rate Success: ${data.toJson()}");
    }, failure: (error) {
      emit(CartState.productRateFailure(error: error.message.toString()));
    });
  }

  Future<void> getRateReviews({required int productId}) async {
    emit(const CartState.rateReviewsLoading());
    final response = await cartRepository.getRateReviews(
      RatingReviewRequestModel(
        pageNumber: 0,
        pageSize: 10,
        searchCriteria: SearchCriteria(
          productId: productId,
          isTopRated: false,
          stars: null,
        ),
      ),
    );

    response.when(success: (data) {
      emit(CartState.rateReviewsSuccess(data));
    }, failure: (error) {
      emit(CartState.rateReviewsFailure(error: error.message.toString()));
    });
  }

  Future<void> getProductRateChart(int productId) async {
    emit(const CartState.rateChartLoading());
    final response = await cartRepository.getProductRateChart(productId);

    response.when(success: (data) {
      emit(CartState.rateChartSuccess(data));
    }, failure: (error) {
      emit(CartState.rateChartFailure(error: error.message.toString()));
    });
  }
}
