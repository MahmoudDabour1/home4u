import 'package:bloc/bloc.dart';
import 'package:home4u/features/rating/data/models/insert_product_rate_body.dart';
import 'package:home4u/features/rating/data/repository/product_rating_repository.dart';
import 'package:home4u/features/rating/logic/product_rating/product_rating_state.dart';

class ProductRatingCubit extends Cubit<ProductRatingState> {
  final ProductRatingRepository _productRatingRepository;

  ProductRatingCubit(this._productRatingRepository)
      : super(const ProductRatingState.initial());

  Future<void> insertProductRating(
      InsertProductRateBody productRateBody) async {
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
}
