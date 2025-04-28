import 'package:hive/hive.dart';

import 'favorite_type_enums.dart';
part 'favorite_model.g.dart';

@HiveType(typeId: 101)
class FavoriteModel {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final FavoriteType type;

  @HiveField(2)
  final String name;

  @HiveField(3)
  final String photo;

  @HiveField(4)
  final String? location;

  @HiveField(5)
  final double rating;

  const FavoriteModel({
    required this.id,
    required this.type,
    required this.name,
    required this.photo,
    this.location,
    required this.rating,
  });
}
