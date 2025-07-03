// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ask_technical_worker_filter_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AskTechnicalWorkerFilterBody _$AskTechnicalWorkerFilterBodyFromJson(
        Map<String, dynamic> json) =>
    AskTechnicalWorkerFilterBody(
      pageNumber: (json['pageNumber'] as num).toInt(),
      searchCriteria: AskTechnicalSearchCriteria.fromJson(
          json['searchCriteria'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AskTechnicalWorkerFilterBodyToJson(
        AskTechnicalWorkerFilterBody instance) =>
    <String, dynamic>{
      'pageNumber': instance.pageNumber,
      'searchCriteria': instance.searchCriteria,
    };

AskTechnicalSearchCriteria _$AskTechnicalSearchCriteriaFromJson(
        Map<String, dynamic> json) =>
    AskTechnicalSearchCriteria(
      userId: (json['userId'] as num?)?.toInt(),
      unitTypeId: (json['unitTypeId'] as num?)?.toInt(),
      governorateId: (json['governorateId'] as num?)?.toInt(),
      cityId: (json['cityId'] as num?)?.toInt(),
      materialId: (json['materialId'] as num?)?.toInt(),
      projectName: json['projectName'] as String?,
      workerTypeId: (json['workerTypeId'] as num?)?.toInt(),
      budgetFrom: (json['budgetFrom'] as num?)?.toDouble(),
      budgetTo: (json['budgetTo'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$AskTechnicalSearchCriteriaToJson(
        AskTechnicalSearchCriteria instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'unitTypeId': instance.unitTypeId,
      'governorateId': instance.governorateId,
      'cityId': instance.cityId,
      'materialId': instance.materialId,
      'projectName': instance.projectName,
      'workerTypeId': instance.workerTypeId,
      'budgetFrom': instance.budgetFrom,
      'budgetTo': instance.budgetTo,
    };
