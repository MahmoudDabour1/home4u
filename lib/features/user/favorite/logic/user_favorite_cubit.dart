import 'package:bloc/bloc.dart';
import 'package:home4u/core/helpers/helper_methods.dart';
import 'package:home4u/features/user/favorite/logic/user_favorite_state.dart';

import '../data/models/favorite_model.dart';
import '../data/models/favorite_type_enums.dart';
import '../data/repository/user_favorite_repository.dart';

class UserFavoriteCubit extends Cubit<UserFavoriteState> {
  FavoriteRepository favoriteRepository;

  UserFavoriteCubit(this.favoriteRepository)
      : super(const UserFavoriteState.initial());

  Future<void> addFavorite(FavoriteModel item) async {
    emit(const UserFavoriteState.loading()); // Show loading
    try {
      await favoriteRepository.addFavorite(item);
      emit(UserFavoriteState.addingFavoriteItem(item));
    } catch (e) {
      emit(UserFavoriteState.error(error: e.toString()));
      await showToast(message: 'Failed to add favorite.', isError: true);
    }
  }

  /// Remove Favorite
  Future<void> removeFavorite(String id) async {
    emit(const UserFavoriteState.loading()); // Show loading
    try {
      await favoriteRepository.removeFavorite(id);
      emit(UserFavoriteState.removingFavoriteItem(id));
    } catch (e) {
      emit(UserFavoriteState.error(error: e.toString()));
      await showToast(message: 'Failed to add favorite.', isError: true);
    }
  }

  /// Get Favorites by Type
  Future<void> getFavorites(FavoriteType type) async {
    emit(const UserFavoriteState.loading()); // Show loading
    try {
      final favorites = favoriteRepository.getFavorites(type);
      emit(UserFavoriteState.gettingFavoriteItem(favorites));
    } catch (e) {
      emit(UserFavoriteState.error(error: e.toString()));
      await showToast(message: 'Failed to add favorite.', isError: true);
    }
  }
}
