import 'package:home4u/features/user/favorite/data/data_source/user_favorites_local_data_source.dart';

import '../models/favorite_model.dart';
import '../models/favorite_type_enums.dart';

abstract class FavoriteRepository {
  Future<void> addFavorite(FavoriteModel item);
  Future<void> removeFavorite(String id);
  List<FavoriteModel> getFavorites(FavoriteType type);
}

class FavoriteRepositoryImpl implements FavoriteRepository {
  final UserFavoriteLocalDataSource localDataSource;

  FavoriteRepositoryImpl(this.localDataSource);

  @override
  Future<void> addFavorite(FavoriteModel item) async {
    await localDataSource.addFavorite(item);
  }

  @override
  Future<void> removeFavorite(String id) async {
    await localDataSource.removeFavorite(id);
  }

  @override
  List<FavoriteModel> getFavorites(FavoriteType type) {
    return localDataSource.getFavoritesByType(type);
  }
}