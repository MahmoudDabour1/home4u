import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:home4u/features/cart/data/models/cart_item_model.dart';

import '../data/models/shop_now_response_model.dart';

part 'cart_state.freezed.dart';

@freezed
class CartState<T> with _$CartState<T> {
  const factory CartState.initial() = _Initial;

  ///shop now
  const factory CartState.shopNowLoading() = ShopNowLoading;

  const factory CartState.shopNowSuccess(ShopNowResponseModel responseModel) =
  ShopNowSuccess;

  const factory CartState.shopNowFailure({required String error}) =
  ShopNowFailure;

  ///pagination
  const factory CartState.paginationLoading() = PaginationLoading;

  const factory CartState.paginationFailure({required String error}) =
  PaginationFailure;

  ///reset Filter
  const factory CartState.resetFilter() = ResetAllFilters;

  ///filter update
  const factory CartState.filterUpdated() = FilterUpdated;


  ///cart
  const factory CartState.cartLoading() = CartLoading;

  const factory CartState.cartEmpty() = cartEmpty;

  const factory CartState.cartSuccess(List<CartItemModel> cartItems) =
  CartSuccess;

  const factory CartState.cartFailure({required String error}) = CartFailure;

  ///Insert Order Details
  const factory CartState.insertOrderLoading() = InsertOrderLoading;

  const factory CartState.insertOrderSuccess(T data) = InsertOrderSuccess<T>;

  const factory CartState.insertOrderFailure({required String error}) =
  InsertOrderFailure;

  ///Product Rate
  const factory CartState.productRateLoading() = ProductRateLoading;

  const factory CartState.productRateSuccess(T data) = ProductRateSuccess<T>;

  const factory CartState.productRateFailure({required String error}) =
  ProductRateFailure;


  ///Product Rate
  const factory CartState.rateReviewsLoading() = RateReviewsLoading;



  const factory CartState.rateReviewsSuccess(T data) = RateReviewsSuccess<T>;



  const factory CartState.rateReviewsFailure({required String error}) =
  RateReviewsFailure;

  ///Product Rate Chart
  const factory CartState.rateChartLoading() = RateChartLoading;



  const factory CartState.rateChartSuccess(T data) = RateChartSuccess<T>;



  const factory CartState.rateChartFailure({required String error}) =
  RateChartFailure;

}
