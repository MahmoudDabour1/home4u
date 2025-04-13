// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'engineering_office_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EngineeringOfficeRequest _$EngineeringOfficeRequestFromJson(
        Map<String, dynamic> json) =>
    EngineeringOfficeRequest(
      tradeName: json['tradeName'] as String,
      description: json['description'] as String,
      engineeringOfficeField: EngineeringOffice.fromJson(
          json['engineeringOfficeField'] as Map<String, dynamic>),
      engineeringOfficeDepartments:
          (json['engineeringOfficeDepartments'] as List<dynamic>)
              .map((e) => EngineeringOffice.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$EngineeringOfficeRequestToJson(
        EngineeringOfficeRequest instance) =>
    <String, dynamic>{
      'tradeName': instance.tradeName,
      'description': instance.description,
      'engineeringOfficeField': instance.engineeringOfficeField,
      'engineeringOfficeDepartments': instance.engineeringOfficeDepartments,
    };

EngineeringOffice _$EngineeringOfficeFromJson(Map<String, dynamic> json) =>
    EngineeringOffice(
      id: (json['id'] as num).toInt(),
    );

Map<String, dynamic> _$EngineeringOfficeToJson(EngineeringOffice instance) =>
    <String, dynamic>{
      'id': instance.id,
    };
