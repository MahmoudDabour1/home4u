import 'package:json_annotation/json_annotation.dart';

part 'shop_now_response_model.g.dart';

@JsonSerializable()
class ShopNowResponseModel {
  @JsonKey(name: "success")
  final bool? success;
  @JsonKey(name: "status")
  final int? status;
  @JsonKey(name: "data")
  final ShopNowData? data;

  ShopNowResponseModel({
    this.success,
    this.status,
    this.data,
  });

  factory ShopNowResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ShopNowResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShopNowResponseModelToJson(this);
}

@JsonSerializable()
class ShopNowData {
  @JsonKey(name: "content")
  final List<ShopNowContent>? content;
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

  ShopNowData({
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

  factory ShopNowData.fromJson(Map<String, dynamic> json) =>
      _$ShopNowDataFromJson(json);

  Map<String, dynamic> toJson() => _$ShopNowDataToJson(this);
}

@JsonSerializable()
class ShopNowContent {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "price")
  final int? price;
  @JsonKey(name: "imagePath")
  final String? imagePath;
  @JsonKey(name: "rate")
  final int? rate;

  ShopNowContent({
    this.id,
    this.name,
    this.price,
    this.imagePath,
    this.rate,
  });

  factory ShopNowContent.fromJson(Map<String, dynamic> json) =>
      _$ShopNowContentFromJson(json);

  Map<String, dynamic> toJson() => _$ShopNowContentToJson(this);
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
