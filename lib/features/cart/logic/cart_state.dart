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

  const factory CartState.cartSuccess(List<CartItemModel> cartItems) =
      CartSuccess;

  const factory CartState.cartFailure({required String error}) = CartFailure;

  ///Insert Order Details
  const factory CartState.insertOrderLoading() = InsertOrderLoading;

  const factory CartState.insertOrderSuccess(T data) = InsertOrderSuccess<T>;

  const factory CartState.insertOrderFailure({required String error}) =
      InsertOrderFailure;

}
