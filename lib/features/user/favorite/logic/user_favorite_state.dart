import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_favorite_state.freezed.dart';

@freezed
class UserFavoriteState<T> with _$UserFavoriteState<T> {
  const factory UserFavoriteState.initial() = _Initial;

  const factory UserFavoriteState.loading() = FavoriteLoading;

  ///Add Favorite
  const factory UserFavoriteState.addingFavoriteItem(T item) = FavoriteAdded;

  ///Remove Favorite
  const factory UserFavoriteState.removingFavoriteItem(T item) =
      FavoriteRemoved;

  ///Get Favorite
  const factory UserFavoriteState.gettingFavoriteItem(List<T> items) =
      FavoriteLoaded;

  ///Error
  const factory UserFavoriteState.error({required String error}) = FavoriteError;
}
