import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState<T> with _$HomeState<T> {
  const factory HomeState.initial() = HomeInitial;

  const factory HomeState.getTopBestSellerLoading() = GetTopBestSellerLoading;

  const factory HomeState.getTopBestSellerSuccess(T data) =
      GetTopBestSellerHomeSuccess<T>;

  const factory HomeState.getTopBestSellerError(String message) =
      GetTopBestSellerHomeError;

  const factory HomeState.getHighestRatedLoading() = GetHighestRatedLoading;

  const factory HomeState.getHighestRatedSuccess(T data) =
      GetHighestRatedHomeSuccess<T>;

  const factory HomeState.getHighestRatedError(String message) =
      GetHighestRatedHomeError;

  const factory HomeState.getRecommendedForYouLoading() =
      GetRecommendedForYouLoading;

  const factory HomeState.getRecommendedForYouSuccess(T data) =
      GetRecommendedForYouHomeSuccess<T>;

  const factory HomeState.getRecommendedForYouError(String message) =
      GetRecommendedForYouHomeError;

  // top engineers
  const factory HomeState.geTopEngineersLoading() = GetTopEngineersLoading;

  const factory HomeState.getTopEngineersSuccess(T data) =
      GetTopEngineersSuccess<T>;

  const factory HomeState.getTopEngineersError(String message) =
      GetTopEngineersError;

  // top workers
  const factory HomeState.geTopWorkersLoading() = GetTopWorkersLoading;

  const factory HomeState.getTopWorkersSuccess(T data) =
      GetTopWorkersSuccess<T>;

  const factory HomeState.getTopWorkersError(String message) =
      GetTopWorkersError;
}
