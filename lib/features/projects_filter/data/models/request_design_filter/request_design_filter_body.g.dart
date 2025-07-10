// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_design_filter_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestDesignFilterBody _$RequestDesignFilterBodyFromJson(
        Map<String, dynamic> json) =>
    RequestDesignFilterBody(
      pageNumber: (json['pageNumber'] as num?)?.toInt(),
      searchCriteria: json['searchCriteria'] == null
          ? null
          : SearchCriteria.fromJson(
              json['searchCriteria'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RequestDesignFilterBodyToJson(
        RequestDesignFilterBody instance) =>
    <String, dynamic>{
      'pageNumber': instance.pageNumber,
      'searchCriteria': instance.searchCriteria,
    };

SearchCriteria _$SearchCriteriaFromJson(Map<String, dynamic> json) =>
    SearchCriteria(
      userId: (json['userId'] as num?)?.toInt(),
      unitTypeId: (json['unitTypeId'] as num?)?.toInt(),
      governorateId: (json['governorateId'] as num?)?.toInt(),
      requiredDurationFrom: (json['requiredDurationFrom'] as num?)?.toInt(),
      requiredDurationTo: (json['requiredDurationTo'] as num?)?.toInt(),
      unitAreaFrom: json['unitAreaFrom'] as num?,
      unitAreaTo: json['unitAreaTo'] as num?,
      budgetFrom: json['budgetFrom'] as num?,
      budgetTo: json['budgetTo'] as num?,
      projectName: json['projectName'] as String?,
    );

Map<String, dynamic> _$SearchCriteriaToJson(SearchCriteria instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'unitTypeId': instance.unitTypeId,
      'governorateId': instance.governorateId,
      'requiredDurationFrom': instance.requiredDurationFrom,
      'requiredDurationTo': instance.requiredDurationTo,
      'unitAreaFrom': instance.unitAreaFrom,
      'unitAreaTo': instance.unitAreaTo,
      'budgetFrom': instance.budgetFrom,
      'budgetTo': instance.budgetTo,
      'projectName': instance.projectName,
    };
