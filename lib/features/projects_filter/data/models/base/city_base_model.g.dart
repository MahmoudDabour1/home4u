// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_base_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CityBaseModel _$CityBaseModelFromJson(Map<String, dynamic> json) =>
    CityBaseModel(
      id: (json['id'] as num?)?.toInt(),
      code: json['code'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$CityBaseModelToJson(CityBaseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
    };
