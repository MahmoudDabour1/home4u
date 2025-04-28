import 'package:hive/hive.dart';
import 'package:home4u/features/user/favorite/data/models/favorite_model.dart';
import '../models/favorite_type_enums.dart';

abstract class UserFavoriteLocalDataSource {
  Future<void> addFavorite(FavoriteModel item);

  Future<void> removeFavorite(String id);

  List<FavoriteModel> getFavoritesByType(FavoriteType type);
}

class LocalFavoriteDataSourceImpl implements UserFavoriteLocalDataSource {
  final Box<FavoriteModel> box;

  LocalFavoriteDataSourceImpl(this.box);

  @override
  Future<void> addFavorite(FavoriteModel item) async {
    await box.put(item.id, item);
  }

  @override
  Future<void> removeFavorite(String id) async {
    await box.delete(id);
  }

  @override
  List<FavoriteModel> getFavoritesByType(FavoriteType type) {
    return box.values.where((e) => e.type == type).toList();
  }
}