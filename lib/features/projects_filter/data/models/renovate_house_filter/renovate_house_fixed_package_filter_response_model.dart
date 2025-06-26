import 'package:freezed_annotation/freezed_annotation.dart';

part  'renovate_house_fixed_package_filter_response_model.g.dart';

@JsonSerializable()
class RenovateHouseFixedPackageFilterResponseModel {
  @JsonKey(name: "success")
  final bool? success;
  @JsonKey(name: "status")
  final int? status;
  @JsonKey(name: "data")
  final Data? data;

  RenovateHouseFixedPackageFilterResponseModel({
    this.success,
    this.status,
    this.data,
  });

  factory RenovateHouseFixedPackageFilterResponseModel.fromJson(
          Map<String, dynamic> json) =>
      _$RenovateHouseFixedPackageFilterResponseModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$RenovateHouseFixedPackageFilterResponseModelToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "content")
  final List<RenovateHouseCustomPackageContent>? content;
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
class RenovateHouseCustomPackageContent {
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

  RenovateHouseCustomPackageContent({
    this.id,
    this.statusCode,
    this.phoneNumber,
    this.isInsideCompound,
    this.unitType,
    this.customPackage,
  });

  factory RenovateHouseCustomPackageContent.fromJson(
          Map<String, dynamic> json) =>
      _$RenovateHouseCustomPackageContentFromJson(json);

  Map<String, dynamic> toJson() =>
      _$RenovateHouseCustomPackageContentToJson(this);
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
