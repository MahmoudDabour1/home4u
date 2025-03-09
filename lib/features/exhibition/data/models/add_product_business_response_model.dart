import 'package:json_annotation/json_annotation.dart';

part 'add_product_business_response_model.g.dart';

@JsonSerializable()
class AddProductBusinessResponseModel {
  @JsonKey(name: "success")
  final bool success;
  @JsonKey(name: "status")
  final int status;
  @JsonKey(name: "data")
  final BusinessAddProductData data;

  AddProductBusinessResponseModel({
    required this.success,
    required this.status,
    required this.data,
  });

  factory AddProductBusinessResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AddProductBusinessResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddProductBusinessResponseModelToJson(this);
}

@JsonSerializable()
class BusinessAddProductData {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "statusCode")
  final int statusCode;
  @JsonKey(name: "nameAr")
  final String nameAr;
  @JsonKey(name: "nameEn")
  final String nameEn;
  @JsonKey(name: "descriptionAr")
  final String descriptionAr;
  @JsonKey(name: "descriptionEn")
  final String descriptionEn;
  @JsonKey(name: "price")
  final double price;
  @JsonKey(name: "length")
  final int length;
  @JsonKey(name: "width")
  final int width;
  @JsonKey(name: "height")
  final int height;
  @JsonKey(name: "businessType")
  final BaseUnit businessType;
  @JsonKey(name: "baseUnit")
  final BaseUnit baseUnit;
  @JsonKey(name: "materials")
  final List<BaseUnit> materials;
  @JsonKey(name: "stocks")
  final List<Stock> stocks;
  @JsonKey(name: "imagePaths")
  final List<dynamic> imagePaths;

  BusinessAddProductData({
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

  factory BusinessAddProductData.fromJson(Map<String, dynamic> json) =>
      _$BusinessAddProductDataFromJson(json);

  Map<String, dynamic> toJson() => _$BusinessAddProductDataToJson(this);
}

@JsonSerializable()
class BaseUnit {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "code")
  final dynamic code;
  @JsonKey(name: "name")
  final dynamic name;
  @JsonKey(name: "hexColor")
  final dynamic hexColor;

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
  final int id;
  @JsonKey(name: "statusCode")
  final dynamic statusCode;
  @JsonKey(name: "color")
  final BaseUnit color;
  @JsonKey(name: "amount")
  final int amount;

  Stock({
    required this.id,
    required this.statusCode,
    required this.color,
    required this.amount,
  });

  factory Stock.fromJson(Map<String, dynamic> json) => _$StockFromJson(json);

  Map<String, dynamic> toJson() => _$StockToJson(this);
}
