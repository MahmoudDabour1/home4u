import 'package:json_annotation/json_annotation.dart';

part 'business_add_product_body.g.dart';

@JsonSerializable()
class BusinessAddProductBody {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "nameAr")
  final String nameAr;
  @JsonKey(name: "nameEn")
  final String nameEn;
  @JsonKey(name: "descriptionAr")
  final String descriptionAr;
  @JsonKey(name: "descriptionEn")
  final String descriptionEn;
  @JsonKey(name: "businessType")
  final BaseUnit businessType;
  @JsonKey(name: "price")
  final double price;
  @JsonKey(name: "length")
  final double length;
  @JsonKey(name: "width")
  final double width;
  @JsonKey(name: "height")
  final double height;
  @JsonKey(name: "baseUnit")
  final BaseUnit baseUnit;
  @JsonKey(name: "materials")
  final List<BaseUnit> materials;
  @JsonKey(name: "stocks")
  final List<Stock> stocks;
  @JsonKey(name: "imagePaths")
  final List<dynamic> imagePaths;

  BusinessAddProductBody({
    required this.nameAr,
    required this.nameEn,
    required this.descriptionAr,
    required this.descriptionEn,
    required this.businessType,
    required this.price,
    required this.length,
    required this.width,
    required this.height,
    required this.baseUnit,
    required this.materials,
    required this.stocks,
    required this.imagePaths,
    this.id
  });

  factory BusinessAddProductBody.fromJson(Map<String, dynamic> json) =>
      _$BusinessAddProductBodyFromJson(json);

  Map<String, dynamic> toJson() => _$BusinessAddProductBodyToJson(this);
}

@JsonSerializable()
class BaseUnit {
  @JsonKey(name: "id")
  final int id;

  BaseUnit({
    required this.id,
  });

  factory BaseUnit.fromJson(Map<String, dynamic> json) =>
      _$BaseUnitFromJson(json);

  Map<String, dynamic> toJson() => _$BaseUnitToJson(this);
}

@JsonSerializable()
class Stock {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "amount")
  final int amount;
  @JsonKey(name: "color")
  final BaseUnit color;

  Stock( {
    this.id,
    required this.amount,
    required this.color,
  });

  factory Stock.fromJson(Map<String, dynamic> json) => _$StockFromJson(json);

  Map<String, dynamic> toJson() => _$StockToJson(this);
}
