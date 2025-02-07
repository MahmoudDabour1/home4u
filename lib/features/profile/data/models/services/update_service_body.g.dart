// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_service_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateServiceBody _$UpdateServiceBodyFromJson(Map<String, dynamic> json) =>
    UpdateServiceBody(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$UpdateServiceBodyToJson(UpdateServiceBody instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
