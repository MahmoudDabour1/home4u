import 'package:json_annotation/json_annotation.dart';

part 'product_update_response.g.dart';

@JsonSerializable()
class ProductUpdateResponse {
  @JsonKey(name: "success")
  bool success;
  @JsonKey(name: "status")
  int status;
  @JsonKey(name: "data")
  Data data;

  ProductUpdateResponse({
    required this.success,
    required this.status,
    required this.data,
  });

  factory ProductUpdateResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductUpdateResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductUpdateResponseToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "statusCode")
  int statusCode;
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
  int length;
  @JsonKey(name: "width")
  double width;
  @JsonKey(name: "height")
  int height;
  @JsonKey(name: "businessType")
  BaseUnit businessType;
  @JsonKey(name: "baseUnit")
  BaseUnit baseUnit;
  @JsonKey(name: "materials")
  List<BaseUnit> materials;
  @JsonKey(name: "stocks")
  List<Stock> stocks;
  @JsonKey(name: "imagePaths")
  List<dynamic> imagePaths;

  Data({
    required this.id,
    required this.statusCode,
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

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class BaseUnit {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "code")
  String code;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "hexColor")
  String? hexColor;

  BaseUnit({
    required this.id,
    required this.code,
    required this.name,
    this.hexColor,
  });

  factory BaseUnit.fromJson(Map<String, dynamic> json) =>
      _$BaseUnitFromJson(json);

  Map<String, dynamic> toJson() => _$BaseUnitToJson(this);
}

@JsonSerializable()
class Stock {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "statusCode")
  dynamic statusCode;
  @JsonKey(name: "color")
  BaseUnit color;
  @JsonKey(name: "amount")
  int amount;

  Stock({
    required this.id,
    required this.statusCode,
    required this.color,
    required this.amount,
  });

  factory Stock.fromJson(Map<String, dynamic> json) => _$StockFromJson(json);

  Map<String, dynamic> toJson() => _$StockToJson(this);
}
