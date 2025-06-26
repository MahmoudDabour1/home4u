// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ask_engineer_filter_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AskEngineerFilterBody _$AskEngineerFilterBodyFromJson(
        Map<String, dynamic> json) =>
    AskEngineerFilterBody(
      pageNumber: (json['pageNumber'] as num?)?.toInt(),
      searchCriteria: json['searchCriteria'] == null
          ? null
          : AskEngineerSearchCriteria.fromJson(
              json['searchCriteria'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AskEngineerFilterBodyToJson(
        AskEngineerFilterBody instance) =>
    <String, dynamic>{
      'pageNumber': instance.pageNumber,
      'searchCriteria': instance.searchCriteria,
    };

AskEngineerSearchCriteria _$AskEngineerSearchCriteriaFromJson(
        Map<String, dynamic> json) =>
    AskEngineerSearchCriteria(
      userId: (json['userId'] as num?)?.toInt(),
      unitTypeId: (json['unitTypeId'] as num?)?.toInt(),
      governorateId: (json['governorateId'] as num?)?.toInt(),
      cityId: (json['cityId'] as num?)?.toInt(),
      urgencyLevelId: (json['urgencyLevelId'] as num?)?.toInt(),
      projectName: json['projectName'] as String?,
      engineerTypeId: (json['engineerTypeId'] as num?)?.toInt(),
      budgetFrom: (json['budgetFrom'] as num?)?.toInt(),
      budgetTo: (json['budgetTo'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AskEngineerSearchCriteriaToJson(
        AskEngineerSearchCriteria instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'unitTypeId': instance.unitTypeId,
      'governorateId': instance.governorateId,
      'cityId': instance.cityId,
      'urgencyLevelId': instance.urgencyLevelId,
      'projectName': instance.projectName,
      'engineerTypeId': instance.engineerTypeId,
      'budgetFrom': instance.budgetFrom,
      'budgetTo': instance.budgetTo,
    };
