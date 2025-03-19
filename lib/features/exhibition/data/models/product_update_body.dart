import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_update_body.g.dart';

@JsonSerializable()
class ProductUpdateBody {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "nameAr")
  String nameAr;
  @JsonKey(name: "nameEn")
  String nameEn;
  @JsonKey(name: "descriptionAr")
  String descriptionAr;
  @JsonKey(name: "descriptionEn")
  String descriptionEn;
  @JsonKey(name: "price")
  double price;
  @JsonKey(name: "length")
  double length;
  @JsonKey(name: "width")
  double width;
  @JsonKey(name: "height")
  double height;
  @JsonKey(name: "businessType")
  UpdateBaseUnit businessType;
  @JsonKey(name: "baseUnit")
  UpdateBaseUnit baseUnit;
  @JsonKey(name: "materials")
  List<UpdateBaseUnit> materials;
  @JsonKey(name: "stocks")
  List<UpdateStock> stocks;
  @JsonKey(name: "imagePaths")
  List<dynamic> imagePaths;

  ProductUpdateBody({
    required this.id,
    required this.nameAr,
    required this.nameEn,
    required this.descriptionAr,
    required this.descriptionEn,
    required this.price,
    required this.length,
    required this.width,
    required this.height,
    required this.businessType,
    required this.baseUnit,
    required this.materials,
    required this.stocks,
    required this.imagePaths,
  });

  factory ProductUpdateBody.fromJson(Map<String, dynamic> json) =>
      _$ProductUpdateBodyFromJson(json);

  Map<String, dynamic> toJson() => _$ProductUpdateBodyToJson(this);
}

@JsonSerializable()
class UpdateBaseUnit {
  @JsonKey(name: "id")
  int id;

  UpdateBaseUnit({
    required this.id,
  });

  factory UpdateBaseUnit.fromJson(Map<String, dynamic> json) =>
      _$UpdateBaseUnitFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateBaseUnitToJson(this);
}

@JsonSerializable()
class UpdateStock {
  @JsonKey(name: "color")
  UpdateBaseUnit color;
  @JsonKey(name: "amount")
  int amount;

  UpdateStock({
    required this.color,
    required this.amount,
  });

  factory UpdateStock.fromJson(Map<String, dynamic> json) =>
      _$UpdateStockFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateStockToJson(this);
}
