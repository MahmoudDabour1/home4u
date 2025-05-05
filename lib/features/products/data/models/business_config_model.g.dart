// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_config_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BusinessConfigModel _$BusinessConfigModelFromJson(Map<String, dynamic> json) =>
    BusinessConfigModel(
      success: json['success'] as bool?,
      status: (json['status'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BusinessConfigModelToJson(
        BusinessConfigModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'status': instance.status,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      colors: (json['colors'] as List<dynamic>?)
          ?.map((e) => FilterColor.fromJson(e as Map<String, dynamic>))
          .toList(),
      productBaseUnits: (json['productBaseUnits'] as List<dynamic>?)
          ?.map((e) => ProductBaseUnit.fromJson(e as Map<String, dynamic>))
          .toList(),
      productMaterial: (json['productMaterial'] as List<dynamic>?)
          ?.map((e) => ProductMaterial.fromJson(e as Map<String, dynamic>))
          .toList(),
      businessTypes: (json['businessTypes'] as List<dynamic>?)
          ?.map((e) => BusinessType.fromJson(e as Map<String, dynamic>))
          .toList(),
      businessTypeCategories: (json['businessTypeCategories'] as List<dynamic>?)
          ?.map((e) => BusinessType.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'colors': instance.colors,
      'productBaseUnits': instance.productBaseUnits,
      'productMaterial': instance.productMaterial,
      'businessTypes': instance.businessTypes,
      'businessTypeCategories': instance.businessTypeCategories,
    };

FilterColor _$FilterColorFromJson(Map<String, dynamic> json) => FilterColor(
      id: (json['id'] as num?)?.toInt(),
      code: json['code'] as String?,
      name: json['name'] as String?,
      hexColor: json['hexColor'] as String?,
    );

Map<String, dynamic> _$FilterColorToJson(FilterColor instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'hexColor': instance.hexColor,
    };

ProductBaseUnit _$ProductBaseUnitFromJson(Map<String, dynamic> json) =>
    ProductBaseUnit(
      id: (json['id'] as num?)?.toInt(),
      code: json['code'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$ProductBaseUnitToJson(ProductBaseUnit instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
    };

ProductMaterial _$ProductMaterialFromJson(Map<String, dynamic> json) =>
    ProductMaterial(
      id: (json['id'] as num?)?.toInt(),
      code: json['code'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$ProductMaterialToJson(ProductMaterial instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
    };

BusinessType _$BusinessTypeFromJson(Map<String, dynamic> json) => BusinessType(
      id: (json['id'] as num?)?.toInt(),
      code: json['code'] as String?,
      name: json['name'] as String?,
      businessType: json['businessType'] == null
          ? null
          : BusinessType.fromJson(json['businessType'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BusinessTypeToJson(BusinessType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'businessType': instance.businessType,
    };
