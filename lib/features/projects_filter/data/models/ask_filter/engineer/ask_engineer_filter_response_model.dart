import 'package:freezed_annotation/freezed_annotation.dart';

import '../../base/photo_base_model.dart';
import '../../base/user_base_model.dart';

part 'ask_engineer_filter_response_model.g.dart';

@JsonSerializable()
class AskEngineerFilterResponseModel {
  @JsonKey(name: "success")
  final bool? success;
  @JsonKey(name: "status")
  final int? status;
  @JsonKey(name: "data")
  final Data? data;

  AskEngineerFilterResponseModel({
    this.success,
    this.status,
    this.data,
  });

  factory AskEngineerFilterResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AskEngineerFilterResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$AskEngineerFilterResponseModelToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "content")
  final List<AskEngineerContent>? content;
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
class AskEngineerContent {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "statusCode")
  final int? statusCode;
  @JsonKey(name: "createdDate")
  final DateTime? createdDate;
  @JsonKey(name: "modifiedDate")
  final DateTime? modifiedDate;
  @JsonKey(name: "phoneNumber")
  final String? phoneNumber;
  @JsonKey(name: "projectName")
  final String? projectName;
  @JsonKey(name: "projectDescription")
  final String? projectDescription;
  @JsonKey(name: "engineerType")
  final EngineerType? engineerType;
  @JsonKey(name: "unitType")
  final EngineerType? unitType;
  @JsonKey(name: "budget")
  final int? budget;
  @JsonKey(name: "city")
  final City? city;
  @JsonKey(name: "governorate")
  final City? governorate;
  @JsonKey(name: "urgencyLevel")
  final EngineerType? urgencyLevel;
  @JsonKey(name: "deadline")
  final DateTime? deadline;
  @JsonKey(name: "photos")
  final List<PhotoBaseModel>? photos;
  @JsonKey(name: "user")
  final UserBaseModel? user;
  @JsonKey(name: "requestCount")
  final int? requestCount;
  @JsonKey(name: "askStatus")
  final String? askStatus;

  AskEngineerContent({
    this.id,
    this.statusCode,
    this.phoneNumber,
    this.projectName,
    this.projectDescription,
    this.engineerType,
    this.unitType,
    this.budget,
    this.city,
    this.governorate,
    this.urgencyLevel,
    this.deadline,
    this.photos,
    this.createdDate,
    this.modifiedDate,
    this.user,
    this.requestCount,
    this.askStatus,
  });

  factory AskEngineerContent.fromJson(Map<String, dynamic> json) =>
      _$AskEngineerContentFromJson(json);

  Map<String, dynamic> toJson() => _$AskEngineerContentToJson(this);
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
class EngineerType {
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

  EngineerType({
    this.id,
    this.code,
    this.name,
    this.nameAr,
    this.nameEn,
  });

  factory EngineerType.fromJson(Map<String, dynamic> json) =>
      _$EngineerTypeFromJson(json);

  Map<String, dynamic> toJson() => _$EngineerTypeToJson(this);
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
