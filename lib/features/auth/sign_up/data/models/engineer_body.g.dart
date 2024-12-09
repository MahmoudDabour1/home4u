// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'engineer_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EngineerRequest _$EngineerRequestFromJson(Map<String, dynamic> json) =>
    EngineerRequest(
      type: EngineerTypeRequest.fromJson(json['type'] as Map<String, dynamic>),
      yearsOfExperience: (json['yearsOfExperience'] as num).toInt(),
      engineerServ: (json['engineerServ'] as List<dynamic>)
          .map(
              (e) => EngineerServiceRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EngineerRequestToJson(EngineerRequest instance) =>
    <String, dynamic>{
      'type': instance.type,
      'yearsOfExperience': instance.yearsOfExperience,
      'engineerServ': instance.engineerServ,
    };

EngineerTypeRequest _$EngineerTypeRequestFromJson(Map<String, dynamic> json) =>
    EngineerTypeRequest(
      id: (json['id'] as num).toInt(),
    );

Map<String, dynamic> _$EngineerTypeRequestToJson(
        EngineerTypeRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

EngineerServiceRequest _$EngineerServiceRequestFromJson(
        Map<String, dynamic> json) =>
    EngineerServiceRequest(
      id: (json['id'] as num).toInt(),
    );

Map<String, dynamic> _$EngineerServiceRequestToJson(
        EngineerServiceRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
    };
