import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_renovate_house_custom_package_body.g.dart';

@JsonSerializable()
class AddRenovateHouseCustomPackageBody {
  @JsonKey(name: "phoneNumber")
  final String phoneNumber;
  @JsonKey(name: "isInsideCompound")
  final bool isInsideCompound;
  @JsonKey(name: "unitType")
  final ItemId unitType;
  @JsonKey(name: "unitStatuses")
  final ItemId unitStatuses;
  @JsonKey(name: "unitWorkTypes")
  final ItemId unitWorkTypes;
  @JsonKey(name: "workSkills")
  final ItemId workSkills;
  @JsonKey(name: "city")
  final ItemId city;
  @JsonKey(name: "governorate")
  final ItemId governorate;
  @JsonKey(name: "unitArea")
  final int unitArea;
  @JsonKey(name: "budget")
  final int budget;
  @JsonKey(name: "region")
  final int region;
  @JsonKey(name: "numberOfRooms")
  final int numberOfRooms;
  @JsonKey(name: "numberOfBathrooms")
  final int numberOfBathrooms;
  @JsonKey(name: "requiredDuration")
  final int requiredDuration;
  @JsonKey(name: "notes")
  final String notes;

  AddRenovateHouseCustomPackageBody({
    required this.phoneNumber,
    required this.isInsideCompound,
    required this.unitType,
    required this.unitStatuses,
    required this.unitWorkTypes,
    required this.workSkills,
    required this.city,
    required this.governorate,
    required this.unitArea,
    required this.budget,
    required this.region,
    required this.numberOfRooms,
    required this.numberOfBathrooms,
    required this.requiredDuration,
    required this.notes,
  });

  factory AddRenovateHouseCustomPackageBody.fromJson(
          Map<String, dynamic> json) =>
      _$AddRenovateHouseCustomPackageBodyFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AddRenovateHouseCustomPackageBodyToJson(this);
}

@JsonSerializable()
class ItemId {
  @JsonKey(name: "id")
  final int id;

  ItemId({
    required this.id,
  });

  factory ItemId.fromJson(Map<String, dynamic> json) => _$ItemIdFromJson(json);

  Map<String, dynamic> toJson() => _$ItemIdToJson(this);
}
