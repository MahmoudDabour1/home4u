import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/insert_product_rate_response_model.dart';

part 'product_rating_state.freezed.dart';

@freezed
class ProductRatingState with _$ProductRatingState {
  const factory ProductRatingState.initial() = _Initial;

  ///Insert product rating
  factory ProductRatingState.insertProductRatingLoading() = InsertProductRatingLoading;

  factory ProductRatingState.insertProductRatingSuccess(InsertProductRateResponseModel response) = InsertProductRatingSuccess;

  factory ProductRatingState.insertProductRatingFailure(String error) = InsertProductRatingFailure;
}
