import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'business_config_model.g.dart';

@HiveType(typeId: 50)
@JsonSerializable()
class BusinessConfigModel {
  @HiveField(0)
  @JsonKey(name: "success")
  final bool? success;

  @HiveField(1)
  @JsonKey(name: "status")
  final int? status;

  @HiveField(2)
  @JsonKey(name: "data")
  final BusinessConfigData? data;

  BusinessConfigModel({
    this.success,
    this.status,
    this.data,
  });

  factory BusinessConfigModel.fromJson(Map<String, dynamic> json) =>
      _$BusinessConfigModelFromJson(json);

  Map<String, dynamic> toJson() => _$BusinessConfigModelToJson(this);
}

@HiveType(typeId: 51)
@JsonSerializable()
class BusinessConfigData {
  @HiveField(0)
  @JsonKey(name: "colors")
  final List<FilterColor>? colors;

  @HiveField(1)
  @JsonKey(name: "productBaseUnits")
  final List<ProductBaseUnit>? productBaseUnits;

  @HiveField(2)
  @JsonKey(name: "productMaterial")
  final List<ProductMaterial>? productMaterial;

  @HiveField(3)
  @JsonKey(name: "businessTypes")
  final List<BusinessType>? businessTypes;

  @HiveField(4)
  @JsonKey(name: "businessTypeCategories")
  final List<BusinessType>? businessTypeCategories;

  BusinessConfigData({
    this.colors,
    this.productBaseUnits,
    this.productMaterial,
    this.businessTypes,
    this.businessTypeCategories,
  });

  factory BusinessConfigData.fromJson(Map<String, dynamic> json) =>
      _$BusinessConfigDataFromJson(json);

  Map<String, dynamic> toJson() => _$BusinessConfigDataToJson(this);
}

@HiveType(typeId: 52)
@JsonSerializable()
class FilterColor {
  @HiveField(0)
  @JsonKey(name: "id")
  final int? id;

  @HiveField(1)
  @JsonKey(name: "code")
  final String? code;

  @HiveField(2)
  @JsonKey(name: "name")
  final String? name;

  @HiveField(3)
  @JsonKey(name: "hexColor")
  final String? hexColor;

  FilterColor({
    this.id,
    this.code,
    this.name,
    this.hexColor,
  });

  factory FilterColor.fromJson(Map<String, dynamic> json) =>
      _$FilterColorFromJson(json);

  Map<String, dynamic> toJson() => _$FilterColorToJson(this);
}

@HiveType(typeId: 53)
@JsonSerializable()
class ProductBaseUnit {
  @HiveField(0)
  @JsonKey(name: "id")
  final int? id;

  @HiveField(1)
  @JsonKey(name: "code")
  final String? code;

  @HiveField(2)
  @JsonKey(name: "name")
  final String? name;

  ProductBaseUnit({
    this.id,
    this.code,
    this.name,
  });

  factory ProductBaseUnit.fromJson(Map<String, dynamic> json) =>
      _$ProductBaseUnitFromJson(json);

  Map<String, dynamic> toJson() => _$ProductBaseUnitToJson(this);
}

@HiveType(typeId: 54)
@JsonSerializable()
class ProductMaterial {
  @HiveField(0)
  @JsonKey(name: "id")
  final int? id;

  @HiveField(1)
  @JsonKey(name: "code")
  final String? code;

  @HiveField(2)
  @JsonKey(name: "name")
  final String? name;

  ProductMaterial({
    this.id,
    this.code,
    this.name,
  });

  factory ProductMaterial.fromJson(Map<String, dynamic> json) =>
      _$ProductMaterialFromJson(json);

  Map<String, dynamic> toJson() => _$ProductMaterialToJson(this);
}

@HiveType(typeId: 55)
@JsonSerializable()
class BusinessType {
  @HiveField(0)
  @JsonKey(name: "id")
  final int? id;

  @HiveField(1)
  @JsonKey(name: "code")
  final String? code;

  @HiveField(2)
  @JsonKey(name: "name")
  final String? name;

  @HiveField(3)
  @JsonKey(name: "businessType")
  final BusinessType? businessType;

  BusinessType({
    this.id,
    this.code,
    this.name,
    this.businessType,
  });

  factory BusinessType.fromJson(Map<String, dynamic> json) =>
      _$BusinessTypeFromJson(json);

  Map<String, dynamic> toJson() => _$BusinessTypeToJson(this);
}