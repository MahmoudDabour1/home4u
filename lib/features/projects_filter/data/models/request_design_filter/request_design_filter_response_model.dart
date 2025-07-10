import 'package:json_annotation/json_annotation.dart';

import '../base/user_base_model.dart';

part 'request_design_filter_response_model.g.dart';

@JsonSerializable()
class RequestDesignFilterResponseModel {
  @JsonKey(name: "success")
  final bool? success;
  @JsonKey(name: "status")
  final int? status;
  @JsonKey(name: "data")
  final RequestFilterData? data;

  RequestDesignFilterResponseModel({
    this.success,
    this.status,
    this.data,
  });

  factory RequestDesignFilterResponseModel.fromJson(
          Map<String, dynamic> json) =>
      _$RequestDesignFilterResponseModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$RequestDesignFilterResponseModelToJson(this);
}

@JsonSerializable()
class RequestFilterData {
  @JsonKey(name: "content")
  final List<RequestDesignFilterContent>? content;
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

  RequestFilterData({
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

  factory RequestFilterData.fromJson(Map<String, dynamic> json) =>
      _$RequestFilterDataFromJson(json);

  Map<String, dynamic> toJson() => _$RequestFilterDataToJson(this);
}

@JsonSerializable()
class RequestDesignFilterContent {
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
  @JsonKey(name: "unitType")
  final UnitType? unitType;
  @JsonKey(name: "governorate")
  final Governorate? governorate;
  @JsonKey(name: "unitArea")
  final int? unitArea;
  @JsonKey(name: "budget")
  final int? budget;
  @JsonKey(name: "requiredDuration")
  final int? requiredDuration;
  @JsonKey(name: "notes")
  final String? notes;
  @JsonKey(name: "user")
  final UserBaseModel? user;
  @JsonKey(name: "requestCount")
  final int? requestCount;
  @JsonKey(name: "askStatus")
  final String? askStatus;

  RequestDesignFilterContent({
    this.id,
    this.statusCode,
    this.phoneNumber,
    this.unitType,
    this.governorate,
    this.unitArea,
    this.budget,
    this.requiredDuration,
    this.notes,
    this.user,
    this.createdDate,
    this.modifiedDate,
    this.requestCount,
    this.askStatus,
  });

  factory RequestDesignFilterContent.fromJson(Map<String, dynamic> json) =>
      _$RequestDesignFilterContentFromJson(json);

  Map<String, dynamic> toJson() => _$RequestDesignFilterContentToJson(this);
}

@JsonSerializable()
class Governorate {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "code")
  final String? code;
  @JsonKey(name: "name")
  final String? name;

  Governorate({
    this.id,
    this.code,
    this.name,
  });

  factory Governorate.fromJson(Map<String, dynamic> json) =>
      _$GovernorateFromJson(json);

  Map<String, dynamic> toJson() => _$GovernorateToJson(this);
}

@JsonSerializable()
class UnitType {
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

  UnitType({
    this.id,
    this.code,
    this.name,
    this.nameAr,
    this.nameEn,
  });

  factory UnitType.fromJson(Map<String, dynamic> json) =>
      _$UnitTypeFromJson(json);

  Map<String, dynamic> toJson() => _$UnitTypeToJson(this);
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
  @JsonKey(name: "unpaged")
  final bool? unpaged;
  @JsonKey(name: "paged")
  final bool? paged;

  Pageable({
    this.pageNumber,
    this.pageSize,
    this.sort,
    this.offset,
    this.unpaged,
    this.paged,
  });

  factory Pageable.fromJson(Map<String, dynamic> json) =>
      _$PageableFromJson(json);

  Map<String, dynamic> toJson() => _$PageableToJson(this);
}

@JsonSerializable()
class Sort {
  @JsonKey(name: "empty")
  final bool? empty;
  @JsonKey(name: "unsorted")
  final bool? unsorted;
  @JsonKey(name: "sorted")
  final bool? sorted;

  Sort({
    this.empty,
    this.unsorted,
    this.sorted,
  });

  factory Sort.fromJson(Map<String, dynamic> json) => _$SortFromJson(json);

  Map<String, dynamic> toJson() => _$SortToJson(this);
}
