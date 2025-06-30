import 'package:freezed_annotation/freezed_annotation.dart';

part 'ask_technical_worker_filter_response_model.g.dart';

@JsonSerializable()
class AskTechnicalWorkerFilterResponseModel {
  @JsonKey(name: "success")
  final bool? success;
  @JsonKey(name: "status")
  final int? status;
  @JsonKey(name: "data")
  final Data? data;

  AskTechnicalWorkerFilterResponseModel({
    this.success,
    this.status,
    this.data,
  });

  factory AskTechnicalWorkerFilterResponseModel.fromJson(Map<String, dynamic> json) => _$AskTechnicalWorkerFilterResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$AskTechnicalWorkerFilterResponseModelToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "content")
  final List<AskTechnicalContent>? content;
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
class AskTechnicalContent {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "statusCode")
  final int? statusCode;
  @JsonKey(name: "projectName")
  final String? projectName;
  @JsonKey(name: "phoneNumber")
  final String? phoneNumber;
  @JsonKey(name: "projectDescription")
  final String? projectDescription;
  @JsonKey(name: "workerType")
  final Type? workerType;
  @JsonKey(name: "unitType")
  final Type? unitType;
  @JsonKey(name: "city")
  final City? city;
  @JsonKey(name: "governorate")
  final City? governorate;
  @JsonKey(name: "material")
  final City? material;
  @JsonKey(name: "budget")
  final int? budget;
  @JsonKey(name: "photos")
  final List<Photo>? photos;

  AskTechnicalContent({
    this.id,
    this.statusCode,
    this.projectName,
    this.phoneNumber,
    this.projectDescription,
    this.workerType,
    this.unitType,
    this.city,
    this.governorate,
    this.material,
    this.budget,
    this.photos,
  });

  factory AskTechnicalContent.fromJson(Map<String, dynamic> json) => _$AskTechnicalContentFromJson(json);

  Map<String, dynamic> toJson() => _$AskTechnicalContentToJson(this);
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
class Photo {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "askWorkerId")
  final int? askWorkerId;
  @JsonKey(name: "photoPath")
  final String? photoPath;

  Photo({
    this.id,
    this.askWorkerId,
    this.photoPath,
  });

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoToJson(this);
}

@JsonSerializable()
class Type {
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

  Type({
    this.id,
    this.code,
    this.name,
    this.nameAr,
    this.nameEn,
  });

  factory Type.fromJson(Map<String, dynamic> json) => _$TypeFromJson(json);

  Map<String, dynamic> toJson() => _$TypeToJson(this);
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

  factory Pageable.fromJson(Map<String, dynamic> json) => _$PageableFromJson(json);

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

