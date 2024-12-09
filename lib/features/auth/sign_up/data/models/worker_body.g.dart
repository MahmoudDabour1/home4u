// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'worker_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TechnicalWorkerRequest _$TechnicalWorkerRequestFromJson(
        Map<String, dynamic> json) =>
    TechnicalWorkerRequest(
      type: WorkerTypeRequest.fromJson(json['type'] as Map<String, dynamic>),
      yearsOfExperience: (json['yearsOfExperience'] as num).toInt(),
      workerServs: (json['workerServs'] as List<dynamic>)
          .map((e) => WorkerServiceRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TechnicalWorkerRequestToJson(
        TechnicalWorkerRequest instance) =>
    <String, dynamic>{
      'type': instance.type,
      'yearsOfExperience': instance.yearsOfExperience,
      'workerServs': instance.workerServs,
    };

WorkerTypeRequest _$WorkerTypeRequestFromJson(Map<String, dynamic> json) =>
    WorkerTypeRequest(
      id: (json['id'] as num).toInt(),
    );

Map<String, dynamic> _$WorkerTypeRequestToJson(WorkerTypeRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

WorkerServiceRequest _$WorkerServiceRequestFromJson(
        Map<String, dynamic> json) =>
    WorkerServiceRequest(
      id: (json['id'] as num).toInt(),
    );

Map<String, dynamic> _$WorkerServiceRequestToJson(
        WorkerServiceRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
    };
