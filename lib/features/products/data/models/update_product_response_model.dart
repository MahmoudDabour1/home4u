
import 'package:json_annotation/json_annotation.dart';

part 'update_product_response_model.g.dart';
@JsonSerializable()
class UpdateProductsResponseModel {
  @JsonKey(name: "success")
  final bool? success;
  @JsonKey(name: "status")
  final int? status;
  @JsonKey(name: "data")
  final UpdateData? data;

  UpdateProductsResponseModel({
    this.success,
    this.status,
    this.data,
  });

  factory UpdateProductsResponseModel.fromJson(Map<String, dynamic> json) => _$UpdateProductsResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateProductsResponseModelToJson(this);
}

@JsonSerializable()
class UpdateData {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "statusCode")
  final dynamic statusCode;
  @JsonKey(name: "nameAr")
  final String? nameAr;
  @JsonKey(name: "nameEn")
  final String? nameEn;
  @JsonKey(name: "descriptionAr")
  final String? descriptionAr;
  @JsonKey(name: "descriptionEn")
  final String? descriptionEn;
  @JsonKey(name: "price")
  final double? price;
  @JsonKey(name: "length")
  final int? length;
  @JsonKey(name: "width")
  final double? width;
  @JsonKey(name: "height")
  final int? height;
  @JsonKey(name: "businessType")
  final UpdateBaseUnit? businessType;
  @JsonKey(name: "baseUnit")
  final UpdateBaseUnit? baseUnit;
  @JsonKey(name: "materials")
  final List<UpdateBaseUnit>? materials;
  @JsonKey(name: "stocks")
  final List<UpdateStock>? stocks;
  @JsonKey(name: "imagePaths")
  final List<dynamic>? imagePaths;

  UpdateData({
    this.id,
    this.statusCode,
    this.nameAr,
    this.nameEn,
    this.descriptionAr,
    this.descriptionEn,
    this.price,
    this.length,
    this.width,
    this.height,
    this.businessType,
    this.baseUnit,
    this.materials,
    this.stocks,
    this.imagePaths,
  });

  factory UpdateData.fromJson(Map<String, dynamic> json) => _$UpdateDataFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateDataToJson(this);
}

@JsonSerializable()
class UpdateBaseUnit {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "code")
  final String? code;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "hexColor")
  final String? hexColor;

  UpdateBaseUnit({
    this.id,
    this.code,
    this.name,
    this.hexColor,
  });

  factory UpdateBaseUnit.fromJson(Map<String, dynamic> json) => _$UpdateBaseUnitFromJson(json);
  Map<String, dynamic> toJson() => _$UpdateBaseUnitToJson(this);
}

@JsonSerializable()
class UpdateStock {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "statusCode")
  final dynamic statusCode;
  @JsonKey(name: "color")
  final UpdateBaseUnit? color;
  @JsonKey(name: "amount")
  final int? amount;

  UpdateStock({
    this.id,
    this.statusCode,
    this.color,
    this.amount,
  });

  factory UpdateStock.fromJson(Map<String, dynamic> json) => _$UpdateStockFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateStockToJson(this);
}
