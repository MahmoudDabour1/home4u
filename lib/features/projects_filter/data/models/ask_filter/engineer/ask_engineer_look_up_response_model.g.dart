// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ask_engineer_look_up_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AskEngineerLookUpResponseModel _$AskEngineerLookUpResponseModelFromJson(
        Map<String, dynamic> json) =>
    AskEngineerLookUpResponseModel(
      success: json['success'] as bool?,
      status: (json['status'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : EngineerData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AskEngineerLookUpResponseModelToJson(
        AskEngineerLookUpResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'status': instance.status,
      'data': instance.data,
    };

EngineerData _$EngineerDataFromJson(Map<String, dynamic> json) => EngineerData(
      engineerType: (json['engineerType'] as List<dynamic>?)
          ?.map((e) => EngineerTypeFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      unitType: (json['unitType'] as List<dynamic>?)
          ?.map((e) => EngineerTypeFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      governorate: (json['governorate'] as List<dynamic>?)
          ?.map((e) => Governorate.fromJson(e as Map<String, dynamic>))
          .toList(),
      urgencyLevel: (json['urgencyLevel'] as List<dynamic>?)
          ?.map((e) => EngineerTypeFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EngineerDataToJson(EngineerData instance) =>
    <String, dynamic>{
      'engineerType': instance.engineerType,
      'unitType': instance.unitType,
      'governorate': instance.governorate,
      'urgencyLevel': instance.urgencyLevel,
    };

EngineerTypeFilter _$EngineerTypeFilterFromJson(Map<String, dynamic> json) =>
    EngineerTypeFilter(
      id: (json['id'] as num?)?.toInt(),
      code: json['code'] as String?,
      name: json['name'] as String?,
      nameAr: json['nameAr'] as String?,
      nameEn: json['nameEn'] as String?,
    );

Map<String, dynamic> _$EngineerTypeFilterToJson(EngineerTypeFilter instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'nameAr': instance.nameAr,
      'nameEn': instance.nameEn,
    };

Governorate _$GovernorateFromJson(Map<String, dynamic> json) => Governorate(
      id: (json['id'] as num?)?.toInt(),
      code: json['code'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$GovernorateToJson(Governorate instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
    };
