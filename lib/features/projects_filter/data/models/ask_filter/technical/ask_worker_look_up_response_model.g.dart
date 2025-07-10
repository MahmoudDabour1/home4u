// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ask_worker_look_up_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AskWorkerLookUpResponseModel _$AskWorkerLookUpResponseModelFromJson(
        Map<String, dynamic> json) =>
    AskWorkerLookUpResponseModel(
      success: json['success'] as bool?,
      status: (json['status'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : WorkerData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AskWorkerLookUpResponseModelToJson(
        AskWorkerLookUpResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'status': instance.status,
      'data': instance.data,
    };

WorkerData _$WorkerDataFromJson(Map<String, dynamic> json) => WorkerData(
      workerType: (json['workerType'] as List<dynamic>?)
          ?.map((e) => TypeFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      unitType: (json['unitType'] as List<dynamic>?)
          ?.map((e) => TypeFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      governorate: (json['governorate'] as List<dynamic>?)
          ?.map((e) => GovernorateFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      material: (json['material'] as List<dynamic>?)
          ?.map((e) => GovernorateFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WorkerDataToJson(WorkerData instance) =>
    <String, dynamic>{
      'workerType': instance.workerType,
      'unitType': instance.unitType,
      'governorate': instance.governorate,
      'material': instance.material,
    };

GovernorateFilter _$GovernorateFilterFromJson(Map<String, dynamic> json) =>
    GovernorateFilter(
      id: (json['id'] as num?)?.toInt(),
      code: json['code'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$GovernorateFilterToJson(GovernorateFilter instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
    };

TypeFilter _$TypeFilterFromJson(Map<String, dynamic> json) => TypeFilter(
      id: (json['id'] as num?)?.toInt(),
      code: json['code'] as String?,
      name: json['name'] as String?,
      nameAr: json['nameAr'] as String?,
      nameEn: json['nameEn'] as String?,
    );

Map<String, dynamic> _$TypeFilterToJson(TypeFilter instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'nameAr': instance.nameAr,
      'nameEn': instance.nameEn,
    };
