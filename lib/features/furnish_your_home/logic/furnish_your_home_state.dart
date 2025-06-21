
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:home4u/features/furnish_your_home/data/models/furnish_your_home_response_model.dart';
part 'furnish_your_home_state.freezed.dart';

@freezed
 class FurnishYourHomeState<T> with _$FurnishYourHomeState<T> {
 const factory FurnishYourHomeState.initial() = FurnishYourHomeInitial<T>;

 const factory FurnishYourHomeState.furnishYourHomeRequestLoading() = FurnishYourHomeRequestLoading<
     T>;

 const factory FurnishYourHomeState.furnishYourHomeRequestSuccess(
     FurnishYourHomeResponseModel furnishYourHomeResponseModel) = FurnishYourHomeRequestSuccess<
     T>;

 const factory FurnishYourHomeState.furnishYourHomeRequestError(
     String message) = FurnishYourHomeRequestError<T>;

}