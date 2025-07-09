import 'package:json_annotation/json_annotation.dart';
part 'ask_worker_look_up_response_model.g.dart';
@JsonSerializable()
class AskWorkerLookUpResponseModel {
  @JsonKey(name: "success")
  final bool? success;
  @JsonKey(name: "status")
  final int? status;
  @JsonKey(name: "data")
  final WorkerData? data;

  AskWorkerLookUpResponseModel({
    this.success,
    this.status,
    this.data,
  });

  factory AskWorkerLookUpResponseModel.fromJson(Map<String, dynamic> json) => _$AskWorkerLookUpResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$AskWorkerLookUpResponseModelToJson(this);
}

@JsonSerializable()
class WorkerData {
  @JsonKey(name: "workerType")
  final List<TypeFilter>? workerType;
  @JsonKey(name: "unitType")
  final List<TypeFilter>? unitType;
  @JsonKey(name: "governorate")
  final List<GovernorateFilter>? governorate;
  @JsonKey(name: "material")
  final List<GovernorateFilter>? material;

  WorkerData({
    this.workerType,
    this.unitType,
    this.governorate,
    this.material,
  });
  factory WorkerData.fromJson(Map<String, dynamic> json) => _$WorkerDataFromJson(json);
  Map<String, dynamic> toJson() => _$WorkerDataToJson(this);
}

@JsonSerializable()
class GovernorateFilter {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "code")
  final String? code;
  @JsonKey(name: "name")
  final String? name;

  GovernorateFilter({
    this.id,
    this.code,
    this.name,
  });
  factory GovernorateFilter.fromJson(Map<String, dynamic> json) => _$GovernorateFilterFromJson(json);
  Map<String, dynamic> toJson() => _$GovernorateFilterToJson(this);
}

@JsonSerializable()
class TypeFilter {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "code")
  final String? code;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "nameAr")
  final String? nameAr;
  @JsonKey(name: "nameEn")
  final String? nameEn;

  TypeFilter({
    this.id,
    this.code,
    this.name,
    this.nameAr,
    this.nameEn,
  });
  factory TypeFilter.fromJson(Map<String, dynamic> json) => _$TypeFilterFromJson(json);
  Map<String, dynamic> toJson() => _$TypeFilterToJson(this);
}
