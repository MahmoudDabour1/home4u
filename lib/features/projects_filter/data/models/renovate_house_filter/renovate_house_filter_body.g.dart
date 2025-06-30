// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'renovate_house_filter_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RenovateHouseFilterBody _$RenovateHouseFilterBodyFromJson(
        Map<String, dynamic> json) =>
    RenovateHouseFilterBody(
      pageNumber: (json['pageNumber'] as num).toInt(),
      searchCriteria: RenovateHouseSearchCriteria.fromJson(
          json['searchCriteria'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RenovateHouseFilterBodyToJson(
        RenovateHouseFilterBody instance) =>
    <String, dynamic>{
      'pageNumber': instance.pageNumber,
      'searchCriteria': instance.searchCriteria,
    };

RenovateHouseSearchCriteria _$RenovateHouseSearchCriteriaFromJson(
        Map<String, dynamic> json) =>
    RenovateHouseSearchCriteria(
      userId: (json['userId'] as num?)?.toInt(),
      unitTypeId: (json['unitTypeId'] as num?)?.toInt(),
      governorateId: (json['governorateId'] as num?)?.toInt(),
      unitWorkTypeId: (json['unitWorkTypeId'] as num?)?.toInt(),
      workSkillId: (json['workSkillId'] as num?)?.toInt(),
      unitStatusId: (json['unitStatusId'] as num?)?.toInt(),
      cityId: (json['cityId'] as num?)?.toInt(),
      requiredDurationFrom: json['requiredDurationFrom'] as num?,
      requiredDurationTo: json['requiredDurationTo'] as num?,
      unitAreaFrom: json['unitAreaFrom'] as num?,
      unitAreaTo: json['unitAreaTo'] as num?,
      budgetFrom: json['budgetFrom'] as num?,
      budgetTo: json['budgetTo'] as num?,
    );

Map<String, dynamic> _$RenovateHouseSearchCriteriaToJson(
        RenovateHouseSearchCriteria instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'unitTypeId': instance.unitTypeId,
      'governorateId': instance.governorateId,
      'unitWorkTypeId': instance.unitWorkTypeId,
      'workSkillId': instance.workSkillId,
      'unitStatusId': instance.unitStatusId,
      'cityId': instance.cityId,
      'requiredDurationFrom': instance.requiredDurationFrom,
      'requiredDurationTo': instance.requiredDurationTo,
      'unitAreaFrom': instance.unitAreaFrom,
      'unitAreaTo': instance.unitAreaTo,
      'budgetFrom': instance.budgetFrom,
      'budgetTo': instance.budgetTo,
    };
