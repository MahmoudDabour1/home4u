import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_preview_response.g.dart';

@JsonSerializable()
class ProductPreviewResponse {
  @JsonKey(name: "success")
  final bool success;
  @JsonKey(name: "status")
  final int status;
  @JsonKey(name: "data")
  final Data data;

  ProductPreviewResponse({
    required this.success,
    required this.status,
    required this.data,
  });

  factory ProductPreviewResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductPreviewResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductPreviewResponseToJson(this);
}

@JsonSerializable()
class Data {
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
  final int price;
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
  final List<ImagePath> imagePaths;

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
  final int id;
  @JsonKey(name: "code")
  final String code;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "hexColor")
  final String? hexColor;

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
class ImagePath {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "productId")
  final int productId;
  @JsonKey(name: "imagePath")
  final String imagePath;

  ImagePath({
    required this.id,
    required this.productId,
    required this.imagePath,
  });

  factory ImagePath.fromJson(Map<String, dynamic> json) =>
      _$ImagePathFromJson(json);

  Map<String, dynamic> toJson() => _$ImagePathToJson(this);
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
