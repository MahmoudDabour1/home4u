import 'package:json_annotation/json_annotation.dart';

part 'business_body.g.dart';

@JsonSerializable()
class BusinessBody {
  @JsonKey(name: "tradName")
  final String tradName;
  @JsonKey(name: "bioAr")
  final String bioAr;
  @JsonKey(name: "bioEn")
  final String bioEn;
  @JsonKey(name: "businessTypes")
  final List<BusinessTypeIds> businessTypes;

  BusinessBody({
    required this.tradName,
    required this.bioAr,
    required this.bioEn,
    required this.businessTypes,
  });

  factory BusinessBody.fromJson(Map<String, dynamic> json) => _$BusinessBodyFromJson(json);

  Map<String, dynamic> toJson() => _$BusinessBodyToJson(this);
}

@JsonSerializable()
class BusinessTypeIds {
  @JsonKey(name: "id")
  final int id;

  BusinessTypeIds({
    required this.id,
  });

  factory BusinessTypeIds.fromJson(Map<String, dynamic> json) => _$BusinessTypeIdsFromJson(json);

  Map<String, dynamic> toJson() => _$BusinessTypeIdsToJson(this);
}
