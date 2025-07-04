import 'package:json_annotation/json_annotation.dart';

part 'ask_technical_worker_filter_body.g.dart';

@JsonSerializable()
class AskTechnicalWorkerFilterBody {
  @JsonKey(name: "pageNumber")
  int pageNumber;
  @JsonKey(name: "searchCriteria")
  AskTechnicalSearchCriteria searchCriteria;

  AskTechnicalWorkerFilterBody({
    required this.pageNumber,
    required this.searchCriteria,
  });

  factory AskTechnicalWorkerFilterBody.fromJson(Map<String, dynamic> json) =>
      _$AskTechnicalWorkerFilterBodyFromJson(json);

  Map<String, dynamic> toJson() => _$AskTechnicalWorkerFilterBodyToJson(this);
}

@JsonSerializable()

class AskTechnicalSearchCriteria {
  @JsonKey(name: "userId")
  final int? userId;
  @JsonKey(name: "unitTypeId")
  final int? unitTypeId;
  @JsonKey(name: "governorateId")
  final int? governorateId;
  @JsonKey(name: "cityId")
  final int? cityId;
  @JsonKey(name: "materialId")
  final int? materialId;
  @JsonKey(name: "projectName")
  final String? projectName;
  @JsonKey(name: "workerTypeId")
  final int? workerTypeId;
  @JsonKey(name: "budgetFrom")
  final double? budgetFrom;
  @JsonKey(name: "budgetTo")
  final double? budgetTo;

  AskTechnicalSearchCriteria({
    this.userId,
    this.unitTypeId,
    this.governorateId,
    this.cityId,
    this.materialId,
    this.projectName,
    this.workerTypeId,
    this.budgetFrom,
    this.budgetTo,
  });

  factory AskTechnicalSearchCriteria.fromJson(Map<String, dynamic> json) =>
      _$AskTechnicalSearchCriteriaFromJson(json);

  Map<String, dynamic> toJson() =>  _$AskTechnicalSearchCriteriaToJson(this);
}
