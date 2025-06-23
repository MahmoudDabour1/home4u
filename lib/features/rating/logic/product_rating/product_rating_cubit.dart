import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:home4u/features/rating/data/models/insert_product_rate_body.dart';
import 'package:home4u/features/rating/data/repository/product_rating_repository.dart';
import 'package:home4u/features/rating/logic/product_rating/product_rating_state.dart';

import '../../data/models/update_product_rate_body.dart';

class ProductRatingCubit extends Cubit<ProductRatingState> {
  final ProductRatingRepository _productRatingRepository;

  ProductRatingCubit(this._productRatingRepository)
      : super(const ProductRatingState.initial());

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController commentController = TextEditingController();
  double rating = 0;

  void updateRating(double value) {
    rating = value;
    emit(ProductRatingState.initial());
  }

  Future<void> validateAndSubmit(int productId) async {
    if (formKey.currentState?.validate() != true || rating == 0) {
      emit(ProductRatingState.insertProductRatingFailure(
          "Please provide a rating and a valid review."));
      return;
    }

    insertProductRating(
      InsertProductRateBody(
        productId: productId,
        rate: rating,
        comment: commentController.text.trim(),
      ),
    );
  }

  Future<void> insertProductRating(
    InsertProductRateBody productRateBody,
  ) async {
    emit(ProductRatingState.insertProductRatingLoading());
    final result =
        await _productRatingRepository.insertProductRate(productRateBody);
    result.when(
      success: (response) =>
          emit(ProductRatingState.insertProductRatingSuccess(response)),
      failure: (error) => emit(ProductRatingState.insertProductRatingFailure(
        error.message.toString(),
      )),
    );
  }

  Future<void> updateProductRating(
    UpdateProductRateBody productRateBody,
  ) async {
    emit(ProductRatingState.updateProductRatingLoading());
    final result =
        await _productRatingRepository.updateProductRate(productRateBody);
    result.when(
      success: (response) =>
          emit(ProductRatingState.updateProductRatingSuccess(response)),
      failure: (error) => emit(ProductRatingState.updateProductRatingFailure(
        error.message.toString(),
      )),
    );
  }

  Future<void> checkIfProductRated(int productId, int userId) async {
    emit(ProductRatingState.checkIfProductRatedLoading());
    final result = await _productRatingRepository.checkIfProductRated(
      productId,
      userId,
    );
    result.when(
      success: (response) =>
          emit(ProductRatingState.checkIfProductRatedSuccess(response.data)),
      failure: (error) => emit(ProductRatingState.checkIfProductRatedFailure(
        error.message.toString(),
      )),
    );
  }
}
