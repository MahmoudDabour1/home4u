import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:home4u/features/rating/data/models/update_product_rate_response_model.dart';

import '../../data/models/insert_product_rate_response_model.dart';

part 'product_rating_state.freezed.dart';

@freezed
class ProductRatingState with _$ProductRatingState {
  const factory ProductRatingState.initial() = _Initial;

  ///Insert product rating
  factory ProductRatingState.insertProductRatingLoading() =
      InsertProductRatingLoading;

  factory ProductRatingState.insertProductRatingSuccess(
      InsertProductRateResponseModel response) = InsertProductRatingSuccess;

  factory ProductRatingState.insertProductRatingFailure(String error) =
      InsertProductRatingFailure;

  ///Update product rating
  factory ProductRatingState.updateProductRatingLoading() =
      UpdateProductRatingLoading;

  factory ProductRatingState.updateProductRatingSuccess(
      UpdateProductRateResponseModel response) = UpdateProductRatingSuccess;

  factory ProductRatingState.updateProductRatingFailure(String error) =
      UpdateProductRatingFailure;

  ///Check if product is rated
  factory ProductRatingState.checkIfProductRatedLoading() =
      CheckIfProductRatedLoading;

  factory ProductRatingState.checkIfProductRatedSuccess(bool isRated) =
      CheckIfProductRatedSuccess;

  factory ProductRatingState.checkIfProductRatedFailure(String error) =
      CheckIfProductRatedFailure;
}
