// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'engineering_office_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EngineeringOfficeBody _$EngineeringOfficeBodyFromJson(
        Map<String, dynamic> json) =>
    EngineeringOfficeBody(
      tradeName: json['tradeName'] as String?,
      description: json['description'] as String?,
      engineeringOfficeField: json['engineeringOfficeField'] == null
          ? null
          : EngineeringOfficeId.fromJson(
              json['engineeringOfficeField'] as Map<String, dynamic>),
      engineeringOfficeDepartments: (json['engineeringOfficeDepartments']
              as List<dynamic>?)
          ?.map((e) => EngineeringOfficeId.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EngineeringOfficeBodyToJson(
        EngineeringOfficeBody instance) =>
    <String, dynamic>{
      'tradeName': instance.tradeName,
      'description': instance.description,
      'engineeringOfficeField': instance.engineeringOfficeField,
      'engineeringOfficeDepartments': instance.engineeringOfficeDepartments,
    };

EngineeringOfficeId _$EngineeringOfficeIdFromJson(Map<String, dynamic> json) =>
    EngineeringOfficeId(
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$EngineeringOfficeIdToJson(
        EngineeringOfficeId instance) =>
    <String, dynamic>{
      'id': instance.id,
    };
