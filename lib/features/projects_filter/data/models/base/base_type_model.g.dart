// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_type_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseTypeModel _$BaseTypeModelFromJson(Map<String, dynamic> json) =>
    BaseTypeModel(
      id: (json['id'] as num?)?.toInt(),
      code: json['code'] as String?,
      name: json['name'] as String?,
      nameAr: json['nameAr'] as String?,
      nameEn: json['nameEn'] as String?,
    );

Map<String, dynamic> _$BaseTypeModelToJson(BaseTypeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'nameAr': instance.nameAr,
      'nameEn': instance.nameEn,
    };
