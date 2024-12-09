// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'engineer_services.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EngineerServices _$EngineerServicesFromJson(Map<String, dynamic> json) =>
    EngineerServices(
      data: (json['data'] as List<dynamic>)
          .map((e) => EngineerServiceData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EngineerServicesToJson(EngineerServices instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

EngineerServiceData _$EngineerServiceDataFromJson(Map<String, dynamic> json) =>
    EngineerServiceData(
      id: (json['id'] as num).toInt(),
      code: json['code'] as String,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$EngineerServiceDataToJson(
        EngineerServiceData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
    };
