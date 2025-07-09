import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_design_filter_body.g.dart';

@JsonSerializable()
class RequestDesignFilterBody {
  @JsonKey(name: "pageNumber")
  final int? pageNumber;
  @JsonKey(name: "searchCriteria")
  final SearchCriteria? searchCriteria;

  RequestDesignFilterBody({
    required this.pageNumber,
    required this.searchCriteria,
  });

  factory RequestDesignFilterBody.fromJson(Map<String, dynamic> json) =>
      _$RequestDesignFilterBodyFromJson(json);

  Map<String, dynamic> toJson() => _$RequestDesignFilterBodyToJson(this);
}

@JsonSerializable()
class SearchCriteria {
  @JsonKey(name: "userId")
  final int? userId;
  @JsonKey(name: "unitTypeId")
  final int? unitTypeId;
  @JsonKey(name: "governorateId")
  final int? governorateId;
  @JsonKey(name: "requiredDurationFrom")
  final int? requiredDurationFrom;
  @JsonKey(name: "requiredDurationTo")
  final int? requiredDurationTo;
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

  SearchCriteria({
    required this.userId,
    required this.unitTypeId,
    required this.governorateId,
    required this.requiredDurationFrom,
    required this.requiredDurationTo,
    required this.unitAreaFrom,
    required this.unitAreaTo,
    required this.budgetFrom,
    required this.budgetTo,
    required this.projectName,
  });

  factory SearchCriteria.fromJson(Map<String, dynamic> json) =>
      _$SearchCriteriaFromJson(json);

  Map<String, dynamic> toJson() => _$SearchCriteriaToJson(this);
}