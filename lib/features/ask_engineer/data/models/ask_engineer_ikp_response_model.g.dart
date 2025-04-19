// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ask_engineer_ikp_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AskEngineerIkpResponseModel _$AskEngineerIkpResponseModelFromJson(
        Map<String, dynamic> json) =>
    AskEngineerIkpResponseModel(
      success: json['success'] as bool?,
      status: (json['status'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AskEngineerIkpResponseModelToJson(
        AskEngineerIkpResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'status': instance.status,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      engineerType: (json['engineerType'] as List<dynamic>?)
          ?.map((e) => EngineerType.fromJson(e as Map<String, dynamic>))
          .toList(),
      unitType: (json['unitType'] as List<dynamic>?)
          ?.map((e) => EngineerType.fromJson(e as Map<String, dynamic>))
          .toList(),
      governorate: (json['governorate'] as List<dynamic>?)
          ?.map((e) => Governorate.fromJson(e as Map<String, dynamic>))
          .toList(),
      urgencyLevel: (json['urgencyLevel'] as List<dynamic>?)
          ?.map((e) => EngineerType.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'engineerType': instance.engineerType,
      'unitType': instance.unitType,
      'governorate': instance.governorate,
      'urgencyLevel': instance.urgencyLevel,
    };

EngineerType _$EngineerTypeFromJson(Map<String, dynamic> json) => EngineerType(
      id: (json['id'] as num?)?.toInt(),
      code: json['code'] as String?,
      name: json['name'] as String?,
      nameAr: json['nameAr'] as String?,
      nameEn: json['nameEn'] as String?,
    );

Map<String, dynamic> _$EngineerTypeToJson(EngineerType instance) =>
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
