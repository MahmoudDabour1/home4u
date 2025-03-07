// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BusinessBody _$BusinessBodyFromJson(Map<String, dynamic> json) => BusinessBody(
      tradName: json['tradName'] as String,
      bioAr: json['bioAr'] as String,
      bioEn: json['bioEn'] as String,
      businessTypes: (json['businessTypes'] as List<dynamic>)
          .map((e) => BusinessTypeIds.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BusinessBodyToJson(BusinessBody instance) =>
    <String, dynamic>{
      'tradName': instance.tradName,
      'bioAr': instance.bioAr,
      'bioEn': instance.bioEn,
      'businessTypes': instance.businessTypes,
    };

BusinessTypeIds _$BusinessTypeIdsFromJson(Map<String, dynamic> json) =>
    BusinessTypeIds(
      id: (json['id'] as num).toInt(),
    );

Map<String, dynamic> _$BusinessTypeIdsToJson(BusinessTypeIds instance) =>
    <String, dynamic>{
      'id': instance.id,
    };
