// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_design_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestDesignBody _$RequestDesignBodyFromJson(Map<String, dynamic> json) =>
    RequestDesignBody(
      phoneNumber: json['phoneNumber'] as String?,
      unitType: json['unitType'] == null
          ? null
          : GovernorateRequest.fromJson(
              json['unitType'] as Map<String, dynamic>),
      governorate: json['governorate'] == null
          ? null
          : GovernorateRequest.fromJson(
              json['governorate'] as Map<String, dynamic>),
      unitArea: (json['unitArea'] as num?)?.toInt(),
      budget: (json['budget'] as num?)?.toInt(),
      requiredDuration: (json['requiredDuration'] as num?)?.toInt(),
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$RequestDesignBodyToJson(RequestDesignBody instance) =>
    <String, dynamic>{
      'phoneNumber': instance.phoneNumber,
      'unitType': instance.unitType,
      'governorate': instance.governorate,
      'unitArea': instance.unitArea,
      'budget': instance.budget,
      'requiredDuration': instance.requiredDuration,
      'notes': instance.notes,
    };

GovernorateRequest _$GovernorateRequestFromJson(Map<String, dynamic> json) =>
    GovernorateRequest(
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$GovernorateRequestToJson(GovernorateRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
    };
