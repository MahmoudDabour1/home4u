import 'package:json_annotation/json_annotation.dart';

part 'renovate_house_filter_body.g.dart';

@JsonSerializable()
class RenovateHouseFilterBody {
  @JsonKey(name: "pageNumber")
  int pageNumber;
  @JsonKey(name: "searchCriteria")
  RenovateHouseSearchCriteria searchCriteria;

  RenovateHouseFilterBody({
    required this.pageNumber,
    required this.searchCriteria,
  });

  factory RenovateHouseFilterBody.fromJson(Map<String, dynamic> json) =>
      _$RenovateHouseFilterBodyFromJson(json);

  Map<String, dynamic> toJson() => _$RenovateHouseFilterBodyToJson(this);
}

@JsonSerializable()
class RenovateHouseSearchCriteria {
  @JsonKey(name: "userId")
  final int? userId;
  @JsonKey(name: "unitTypeId")
  final int? unitTypeId;
  @JsonKey(name: "governorateId")
  final int? governorateId;
  @JsonKey(name: "unitWorkTypeId")
  final int? unitWorkTypeId;
  @JsonKey(name: "workSkillId")
  final int? workSkillId;
  @JsonKey(name: "unitStatusId")
  final int? unitStatusId;
  @JsonKey(name: "cityId")
  final int? cityId;
  @JsonKey(name: "requiredDurationFrom")
  final num? requiredDurationFrom;
  @JsonKey(name: "requiredDurationTo")
  final num? requiredDurationTo;
  @JsonKey(name: "unitAreaFrom")
  final num? unitAreaFrom;
  @JsonKey(name: "unitAreaTo")
  final num? unitAreaTo;
  @JsonKey(name: "budgetFrom")
  final num? budgetFrom;
  @JsonKey(name: "budgetTo")
  final num? budgetTo;
  @JsonKey(name: "projectName")
  final String? projectName;

  RenovateHouseSearchCriteria({
    required this.userId,
    required this.unitTypeId,
    required this.governorateId,
    required this.unitWorkTypeId,
    required this.workSkillId,
    required this.unitStatusId,
    required this.cityId,
    required this.requiredDurationFrom,
    required this.requiredDurationTo,
    required this.unitAreaFrom,
    required this.unitAreaTo,
    required this.budgetFrom,
    required this.budgetTo,
    required this.projectName,
  });

  factory RenovateHouseSearchCriteria.fromJson(Map<String, dynamic> json) =>
      _$RenovateHouseSearchCriteriaFromJson(json);

  Map<String, dynamic> toJson() => _$RenovateHouseSearchCriteriaToJson(this);
}
