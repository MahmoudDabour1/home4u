import 'package:json_annotation/json_annotation.dart';
part 'renovate_house_filter_response_model.g.dart';

@JsonSerializable()
class RenovateHouseFilterResponseModel {
  @JsonKey(name: "success")
  final bool? success;
  @JsonKey(name: "status")
  final int? status;
  @JsonKey(name: "data")
  final Data? data;

  RenovateHouseFilterResponseModel({
    this.success,
    this.status,
    this.data,
  });

  factory RenovateHouseFilterResponseModel.fromJson(
          Map<String, dynamic> json) =>
      _$RenovateHouseFilterResponseModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$RenovateHouseFilterResponseModelToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "content")
  final List<RenovateHouseContent>? content;
  @JsonKey(name: "pageable")
  final Pageable? pageable;
  @JsonKey(name: "totalPages")
  final int? totalPages;
  @JsonKey(name: "totalElements")
  final int? totalElements;
  @JsonKey(name: "last")
  final bool? last;
  @JsonKey(name: "size")
  final int? size;
  @JsonKey(name: "number")
  final int? number;
  @JsonKey(name: "sort")
  final Sort? sort;
  @JsonKey(name: "numberOfElements")
  final int? numberOfElements;
  @JsonKey(name: "first")
  final bool? first;
  @JsonKey(name: "empty")
  final bool? empty;

  Data({
    this.content,
    this.pageable,
    this.totalPages,
    this.totalElements,
    this.last,
    this.size,
    this.number,
    this.sort,
    this.numberOfElements,
    this.first,
    this.empty,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class RenovateHouseContent {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "statusCode")
  final int? statusCode;
  @JsonKey(name: "phoneNumber")
  final String? phoneNumber;
  @JsonKey(name: "isInsideCompound")
  final bool? isInsideCompound;
  @JsonKey(name: "unitType")
  final UnitStatuses? unitType;
  @JsonKey(name: "unitStatuses")
  final UnitStatuses? unitStatuses;
  @JsonKey(name: "unitWorkTypes")
  final UnitStatuses? unitWorkTypes;
  @JsonKey(name: "workSkills")
  final UnitStatuses? workSkills;
  @JsonKey(name: "city")
  final City? city;
  @JsonKey(name: "governorate")
  final City? governorate;
  @JsonKey(name: "unitArea")
  final int? unitArea;
  @JsonKey(name: "budget")
  final int? budget;
  @JsonKey(name: "region")
  final int? region;
  @JsonKey(name: "numberOfRooms")
  final int? numberOfRooms;
  @JsonKey(name: "numberOfBathrooms")
  final int? numberOfBathrooms;
  @JsonKey(name: "requiredDuration")
  final int? requiredDuration;
  @JsonKey(name: "notes")
  final String? notes;

  RenovateHouseContent({
    this.id,
    this.statusCode,
    this.phoneNumber,
    this.isInsideCompound,
    this.unitType,
    this.unitStatuses,
    this.unitWorkTypes,
    this.workSkills,
    this.city,
    this.governorate,
    this.unitArea,
    this.budget,
    this.region,
    this.numberOfRooms,
    this.numberOfBathrooms,
    this.requiredDuration,
    this.notes,
  });

  factory RenovateHouseContent.fromJson(Map<String, dynamic> json) =>
      _$RenovateHouseContentFromJson(json);

  Map<String, dynamic> toJson() => _$RenovateHouseContentToJson(this);
}

@JsonSerializable()
class City {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "code")
  final String? code;
  @JsonKey(name: "name")
  final String? name;

  City({
    this.id,
    this.code,
    this.name,
  });

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);

  Map<String, dynamic> toJson() => _$CityToJson(this);
}

@JsonSerializable()
class UnitStatuses {
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

  UnitStatuses({
    this.id,
    this.code,
    this.name,
    this.nameAr,
    this.nameEn,
  });

  factory UnitStatuses.fromJson(Map<String, dynamic> json) =>
      _$UnitStatusesFromJson(json);

  Map<String, dynamic> toJson() => _$UnitStatusesToJson(this);
}

@JsonSerializable()
class Pageable {
  @JsonKey(name: "pageNumber")
  final int? pageNumber;
  @JsonKey(name: "pageSize")
  final int? pageSize;
  @JsonKey(name: "sort")
  final Sort? sort;
  @JsonKey(name: "offset")
  final int? offset;
  @JsonKey(name: "paged")
  final bool? paged;
  @JsonKey(name: "unpaged")
  final bool? unpaged;

  Pageable({
    this.pageNumber,
    this.pageSize,
    this.sort,
    this.offset,
    this.paged,
    this.unpaged,
  });

  factory Pageable.fromJson(Map<String, dynamic> json) =>
      _$PageableFromJson(json);

  Map<String, dynamic> toJson() => _$PageableToJson(this);
}

@JsonSerializable()
class Sort {
  @JsonKey(name: "empty")
  final bool? empty;
  @JsonKey(name: "sorted")
  final bool? sorted;
  @JsonKey(name: "unsorted")
  final bool? unsorted;

  Sort({
    this.empty,
    this.sorted,
    this.unsorted,
  });

  factory Sort.fromJson(Map<String, dynamic> json) => _$SortFromJson(json);

  Map<String, dynamic> toJson() => _$SortToJson(this);
}
