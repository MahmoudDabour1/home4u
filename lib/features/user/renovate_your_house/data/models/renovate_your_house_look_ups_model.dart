import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'renovate_your_house_look_ups_model.g.dart';

@HiveType(typeId: 95)
@JsonSerializable()
class RenovateYourHouseLookUpsModel {
  @HiveField(1)
  @JsonKey(name: "success")
  final bool success;
  @HiveField(3)
  @JsonKey(name: "status")
  final int status;
  @HiveField(5)
  @JsonKey(name: "data")
  final Data data;

  RenovateYourHouseLookUpsModel({
    required this.success,
    required this.status,
    required this.data,
  });

  factory RenovateYourHouseLookUpsModel.fromJson(Map<String, dynamic> json) => _$RenovateYourHouseLookUpsModelFromJson(json);

  Map<String, dynamic> toJson() => _$RenovateYourHouseLookUpsModelToJson(this);
}

@HiveType(typeId: 2)
@JsonSerializable()
class Data {
  @HiveField(1)
  @JsonKey(name: "unitTypes")
  final List<UnitStatus> unitTypes;
  @HiveField(3)
  @JsonKey(name: "unitStatuses")
  final List<UnitStatus> unitStatuses;
  @HiveField(5)
  @JsonKey(name: "unitWorkTypes")
  final List<UnitStatus> unitWorkTypes;
  @HiveField(7)
  @JsonKey(name: "workSkills")
  final List<UnitStatus> workSkills;
  @HiveField(9)
  @JsonKey(name: "governorates")
  final List<Governorate> governorates;

  Data({
    required this.unitTypes,
    required this.unitStatuses,
    required this.unitWorkTypes,
    required this.workSkills,
    required this.governorates,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@HiveType(typeId: 3)
@JsonSerializable()
class Governorate {
  @HiveField(1)
  @JsonKey(name: "id")
  final int id;
  @HiveField(3)
  @JsonKey(name: "code")
  final String code;
  @HiveField(5)
  @JsonKey(name: "name")
  final String name;

  Governorate({
    required this.id,
    required this.code,
    required this.name,
  });

  factory Governorate.fromJson(Map<String, dynamic> json) => _$GovernorateFromJson(json);

  Map<String, dynamic> toJson() => _$GovernorateToJson(this);
}

@HiveType(typeId: 4)
@JsonSerializable()
class UnitStatus {
  @HiveField(1)
  @JsonKey(name: "id")
  final int id;
  @HiveField(3)
  @JsonKey(name: "code")
  final String code;
  @HiveField(5)
  @JsonKey(name: "name")
  final String name;
  @HiveField(7)
  @JsonKey(name: "nameAr")
  final String nameAr;
  @HiveField(9)
  @JsonKey(name: "nameEn")
  final String nameEn;

  UnitStatus({
    required this.id,
    required this.code,
    required this.name,
    required this.nameAr,
    required this.nameEn,
  });

  factory UnitStatus.fromJson(Map<String, dynamic> json) => _$UnitStatusFromJson(json);

  Map<String, dynamic> toJson() => _$UnitStatusToJson(this);
}
