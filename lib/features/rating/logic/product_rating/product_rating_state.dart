import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/product_rate_response_model.dart';

part 'product_rating_state.freezed.dart';

@freezed
class ProductRatingState with _$ProductRatingState {
  const factory ProductRatingState.initial() = _Initial;

  ///Insert product rating
  factory ProductRatingState.insertProductRatingLoading() =
      InsertProductRatingLoading;

  factory ProductRatingState.insertProductRatingSuccess(
      ProductRateResponseModel response) = InsertProductRatingSuccess;

  factory ProductRatingState.insertProductRatingFailure(String error) =
      InsertProductRatingFailure;

  ///Update product rating
  factory ProductRatingState.updateProductRatingLoading() =
      UpdateProductRatingLoading;

  factory ProductRatingState.updateProductRatingSuccess(
      ProductRateResponseModel response) = UpdateProductRatingSuccess;

  factory ProductRatingState.updateProductRatingFailure(String error) =
      UpdateProductRatingFailure;

  /// Find product rating by productId and userId
  factory ProductRatingState.findProductRatingLoading() =
      FindProductRatingLoading;

  factory ProductRatingState.findProductRatingSuccess(
      ProductRateResponseModel response) = FindProductRatingSuccess;

  factory ProductRatingState.findProductRatingFailure(String error) =
      FindProductRatingFailure;
}
