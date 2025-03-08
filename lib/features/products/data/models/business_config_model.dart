

import 'package:json_annotation/json_annotation.dart';

part 'business_config_model.g.dart';



@JsonSerializable()
class BusinessConfigModel {
  @JsonKey(name: "success")
  final bool? success;
  @JsonKey(name: "status")
  final int? status;
  @JsonKey(name: "data")
  final Data? data;

  BusinessConfigModel({
    this.success,
    this.status,
    this.data,
  });

  factory BusinessConfigModel.fromJson(Map<String, dynamic> json) => _$BusinessConfigModelFromJson(json);

  Map<String, dynamic> toJson() => _$BusinessConfigModelToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "colors")
  final List<FilterColor>? colors;
  @JsonKey(name: "productBaseUnits")
  final List<ProductBaseUnit>? productBaseUnits;
  @JsonKey(name: "productMaterial")
  final List<ProductMaterial>? productMaterial;
  @JsonKey(name: "businessTypes")
  final List<BusinessType>? businessTypes;

  Data({
    this.colors,
    this.productBaseUnits,
    this.productMaterial,
    this.businessTypes,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
@JsonSerializable()
class FilterColor {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "code")
  final String? code;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "hexColor")
  final String? hexColor;

  FilterColor({
    this.id,
    this.code,
    this.name,
    this.hexColor,
  });

  factory FilterColor.fromJson(Map<String, dynamic> json) => _$FilterColorFromJson(json);

  Map<String, dynamic> toJson() => _$FilterColorToJson(this);
}


@JsonSerializable()
class ProductBaseUnit {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "code")
  final String? code;
  @JsonKey(name: "name")
  final String? name;

  ProductBaseUnit({
    this.id,
    this.code,
    this.name,
  });

  factory ProductBaseUnit.fromJson(Map<String, dynamic> json) => _$ProductBaseUnitFromJson(json);

  Map<String, dynamic> toJson() => _$ProductBaseUnitToJson(this);
}


@JsonSerializable()
class ProductMaterial {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "code")
  final String? code;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "statusCode")
  final int? statusCode;

  ProductMaterial({
    this.id,
    this.code,
    this.name,
    this.statusCode,
  });

  factory ProductMaterial.fromJson(Map<String, dynamic> json) => _$ProductMaterialFromJson(json);

  Map<String, dynamic> toJson() => _$ProductMaterialToJson(this);
}

@JsonSerializable()
class BusinessType {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "code")
  final String? code;
  @JsonKey(name: "name")
  final String? name;


  BusinessType({
    this.id,
    this.code,
    this.name,
  });

  factory BusinessType.fromJson(Map<String, dynamic> json) => _$BusinessTypeFromJson(json);

  Map<String, dynamic> toJson() => _$BusinessTypeToJson(this);
}