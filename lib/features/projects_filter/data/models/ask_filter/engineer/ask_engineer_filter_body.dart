import 'package:freezed_annotation/freezed_annotation.dart';

part 'ask_engineer_filter_body.g.dart';

@JsonSerializable()
class AskEngineerFilterBody {
  @JsonKey(name: "pageNumber")
  final int? pageNumber;
  @JsonKey(name: "searchCriteria")
  final AskEngineerSearchCriteria? searchCriteria;

  AskEngineerFilterBody({
    this.pageNumber,
    this.searchCriteria,
  });

  factory AskEngineerFilterBody.fromJson(Map<String, dynamic> json) =>
      _$AskEngineerFilterBodyFromJson(json);

  Map<String, dynamic> toJson() => _$AskEngineerFilterBodyToJson(this);
}

@JsonSerializable()
class AskEngineerSearchCriteria {
  @JsonKey(name: "userId")
  final int? userId;
  @JsonKey(name: "unitTypeId")
  final int? unitTypeId;
  @JsonKey(name: "governorateId")
  final int? governorateId;
  @JsonKey(name: "cityId")
  final int? cityId;
  @JsonKey(name: "urgencyLevelId")
  final int? urgencyLevelId;
  @JsonKey(name: "projectName")
  final String? projectName;
  @JsonKey(name: "engineerTypeId")
  final int? engineerTypeId;
  @JsonKey(name: "budgetFrom")
  final int? budgetFrom;
  @JsonKey(name: "budgetTo")
  final int? budgetTo;

  AskEngineerSearchCriteria({
    this.userId,
    this.unitTypeId,
    this.governorateId,
    this.cityId,
    this.urgencyLevelId,
    this.projectName,
    this.engineerTypeId,
    this.budgetFrom,
    this.budgetTo,
  });

  factory AskEngineerSearchCriteria.fromJson(Map<String, dynamic> json) =>
      _$AskEngineerSearchCriteriaFromJson(json);

  Map<String, dynamic> toJson() => _$AskEngineerSearchCriteriaToJson(this);
}
