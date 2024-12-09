// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'engineer_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EngineerTypes _$EngineerTypesFromJson(Map<String, dynamic> json) =>
    EngineerTypes(
      data: (json['data'] as List<dynamic>)
          .map((e) => EngineerTypeData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EngineerTypesToJson(EngineerTypes instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

EngineerTypeData _$EngineerTypeDataFromJson(Map<String, dynamic> json) =>
    EngineerTypeData(
      id: (json['id'] as num).toInt(),
      code: json['code'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$EngineerTypeDataToJson(EngineerTypeData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
    };
