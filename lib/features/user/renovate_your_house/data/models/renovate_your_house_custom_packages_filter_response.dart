import 'package:freezed_annotation/freezed_annotation.dart';

part 'renovate_your_house_custom_packages_filter_response.g.dart';

@JsonSerializable()
class RenovateYourHouseCustomPackagesFilterResponse {
  @JsonKey(name: "success")
  final bool? success;
  @JsonKey(name: "status")
  final int? status;
  @JsonKey(name: "data")
  final Data? data;

  RenovateYourHouseCustomPackagesFilterResponse({
    this.success,
    this.status,
    this.data,
  });

  factory RenovateYourHouseCustomPackagesFilterResponse.fromJson(
          Map<String, dynamic> json) =>
      _$RenovateYourHouseCustomPackagesFilterResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$RenovateYourHouseCustomPackagesFilterResponseToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "content")
  final List<CustomPackagesContent>? content;
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
class CustomPackagesContent {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "statusCode")
  final int? statusCode;
  @JsonKey(name: "phoneNumber")
  final String? phoneNumber;
  @JsonKey(name: "isInsideCompound")
  final bool? isInsideCompound;
  @JsonKey(name: "unitType")
  final UnitType? unitType;
  @JsonKey(name: "customPackage")
  final CustomPackage? customPackage;

  CustomPackagesContent({
    this.id,
    this.statusCode,
    this.phoneNumber,
    this.isInsideCompound,
    this.unitType,
    this.customPackage,
  });

   factory CustomPackagesContent.fromJson(Map<String, dynamic> json) =>
      _$CustomPackagesContentFromJson(json);

  Map<String, dynamic> toJson() => _$CustomPackagesContentToJson(this);
}

@JsonSerializable()
class CustomPackage {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "statusCode")
  final int? statusCode;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "nameAr")
  final String? nameAr;
  @JsonKey(name: "nameEn")
  final String? nameEn;
  @JsonKey(name: "price")
  final int? price;
  @JsonKey(name: "details")
  final String? details;
  @JsonKey(name: "detailsAr")
  final String? detailsAr;
  @JsonKey(name: "detailsEn")
  final String? detailsEn;

  CustomPackage({
    this.id,
    this.statusCode,
    this.name,
    this.nameAr,
    this.nameEn,
    this.price,
    this.details,
    this.detailsAr,
    this.detailsEn,
  });

  factory CustomPackage.fromJson(Map<String, dynamic> json) =>
      _$CustomPackageFromJson(json);

  Map<String, dynamic> toJson() => _$CustomPackageToJson(this);
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
