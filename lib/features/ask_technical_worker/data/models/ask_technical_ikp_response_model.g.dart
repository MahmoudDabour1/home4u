// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ask_technical_ikp_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AskTechnicalIkpResponseModel _$AskTechnicalIkpResponseModelFromJson(
        Map<String, dynamic> json) =>
    AskTechnicalIkpResponseModel(
      success: json['success'] as bool?,
      status: (json['status'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AskTechnicalIkpResponseModelToJson(
        AskTechnicalIkpResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'status': instance.status,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      workerType: (json['workerType'] as List<dynamic>?)
          ?.map((e) => AskTechnicalType.fromJson(e as Map<String, dynamic>))
          .toList(),
      unitType: (json['unitType'] as List<dynamic>?)
          ?.map((e) => AskTechnicalType.fromJson(e as Map<String, dynamic>))
          .toList(),
      governorate: (json['governorate'] as List<dynamic>?)
          ?.map((e) => Governorate.fromJson(e as Map<String, dynamic>))
          .toList(),
      material: (json['material'] as List<dynamic>?)
          ?.map((e) => Governorate.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'workerType': instance.workerType,
      'unitType': instance.unitType,
      'governorate': instance.governorate,
      'material': instance.material,
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

AskTechnicalType _$AskTechnicalTypeFromJson(Map<String, dynamic> json) =>
    AskTechnicalType(
      id: (json['id'] as num?)?.toInt(),
      code: json['code'] as String?,
      name: json['name'] as String?,
      nameAr: json['nameAr'] as String?,
      nameEn: json['nameEn'] as String?,
    );

Map<String, dynamic> _$AskTechnicalTypeToJson(AskTechnicalType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'nameAr': instance.nameAr,
      'nameEn': instance.nameEn,
    };
