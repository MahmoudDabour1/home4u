import 'package:json_annotation/json_annotation.dart';

part 'rating_reviews_response_model.g.dart';
@JsonSerializable()
class RatingReviewResponseModel {
  @JsonKey(name: "success")
  final bool? success;
  @JsonKey(name: "status")
  final int? status;
  @JsonKey(name: "data")
  final Data? data;

  RatingReviewResponseModel({
    this.success,
    this.status,
    this.data,
  });

  factory RatingReviewResponseModel.fromJson(Map<String, dynamic> json) => _$RatingReviewResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$RatingReviewResponseModelToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "content")
  final List<Content>? content;
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
class Content {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "userId")
  final int? userId;
  @JsonKey(name: "userName")
  final String? userName;
  @JsonKey(name: "userImage")
  final dynamic userImage;
  @JsonKey(name: "createdDate")
  final String? createdDate;
  @JsonKey(name: "rate")
  final double? rate;
  @JsonKey(name: "comment")
  final String? comment;

  Content({
    this.id,
    this.userId,
    this.userName,
    this.userImage,
    this.createdDate,
    this.rate,
    this.comment,
  });

  factory Content.fromJson(Map<String, dynamic> json) => _$ContentFromJson(json);

  Map<String, dynamic> toJson() => _$ContentToJson(this);
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
