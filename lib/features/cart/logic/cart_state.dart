import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/shop_now_response_model.dart';

part 'cart_state.freezed.dart';

@freezed
class CartState with _$CartState {
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
  const factory CartState.resetFilter() = ResetFilter;
}
