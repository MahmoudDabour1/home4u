import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'products_response_model.g.dart';

@HiveType(typeId: 80)
@JsonSerializable()
class ProductsResponseModel {
  @HiveField(0)
  @JsonKey(name: "success")
  final bool? success;

  @HiveField(1)
  @JsonKey(name: "status")
  final int? status;

  @HiveField(2)
  @JsonKey(name: "data")
  final Data? data;

  ProductsResponseModel({this.success, this.status, this.data});

  factory ProductsResponseModel.fromJson(Map<String, dynamic> json) => _$ProductsResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsResponseModelToJson(this);
}

@HiveType(typeId: 81)
@JsonSerializable()
class Data {
  @HiveField(0)
  @JsonKey(name: "content")
  final List<Content>? content;

  @HiveField(1)
  @JsonKey(name: "pageable")
  final Pageable? pageable;

  @HiveField(2)
  @JsonKey(name: "totalPages")
  final int? totalPages;

  @HiveField(3)
  @JsonKey(name: "totalElements")
  final int? totalElements;

  @HiveField(4)
  @JsonKey(name: "last")
  final bool? last;

  @HiveField(5)
  @JsonKey(name: "size")
  final int? size;

  @HiveField(6)
  @JsonKey(name: "number")
  final int? number;

  @HiveField(7)
  @JsonKey(name: "sort")
  final Sort? sort;

  @HiveField(8)
  @JsonKey(name: "numberOfElements")
  final int? numberOfElements;

  @HiveField(9)
  @JsonKey(name: "first")
  final bool? first;

  @HiveField(10)
  @JsonKey(name: "empty")
  final bool? empty;

  Data({this.content, this.pageable, this.totalPages, this.totalElements, this.last, this.size, this.number, this.sort, this.numberOfElements, this.first, this.empty});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@HiveType(typeId: 82)
@JsonSerializable()
class Content {
  @HiveField(0)
  @JsonKey(name: "id")
  final int? id;

  @HiveField(1)
  @JsonKey(name: "name")
  final String? name;

  @HiveField(2)
  @JsonKey(name: "type")
  final String? type;

  @HiveField(3)
  @JsonKey(name: "price")
  final double? price;

  @HiveField(4)
  @JsonKey(name: "stockAmount")
  final int? stockAmount;

  @HiveField(5)
  @JsonKey(name: "length")
  final int? length;

  @HiveField(6)
  @JsonKey(name: "width")
  final double? width;

  @HiveField(7)
  @JsonKey(name: "height")
  final int? height;

  @HiveField(8)
  @JsonKey(name: "rate")
  final int? rate;

  @HiveField(9)
  @JsonKey(name: "colors")
  final List<Color>? colors;

  @HiveField(10)
  @JsonKey(name: "imagePath")
  final String? imagePath;

  @HiveField(11)
  @JsonKey(name: "inStock")
  final bool? inStock;

  Content({this.id, this.name, this.type, this.price, this.stockAmount, this.length, this.width, this.height, this.rate, this.colors, this.imagePath, this.inStock});

  factory Content.fromJson(Map<String, dynamic> json) => _$ContentFromJson(json);

  Map<String, dynamic> toJson() => _$ContentToJson(this);
}

@HiveType(typeId: 83)
@JsonSerializable()
class Color {
  @HiveField(0)
  @JsonKey(name: "id")
  final int? id;

  @HiveField(1)
  @JsonKey(name: "code")
  final String? code;

  @HiveField(2)
  @JsonKey(name: "name")
  final String? name;

  @HiveField(3)
  @JsonKey(name: "hexColor")
  final String? hexColor;

  Color({this.id, this.code, this.name, this.hexColor});

  factory Color.fromJson(Map<String, dynamic> json) => _$ColorFromJson(json);

  Map<String, dynamic> toJson() => _$ColorToJson(this);
}

@HiveType(typeId: 84)
@JsonSerializable()
class Pageable {
  @HiveField(0)
  @JsonKey(name: "pageNumber")
  final int? pageNumber;

  @HiveField(1)
  @JsonKey(name: "pageSize")
  final int? pageSize;

  @HiveField(2)
  @JsonKey(name: "sort")
  final Sort? sort;

  @HiveField(3)
  @JsonKey(name: "offset")
  final int? offset;

  @HiveField(4)
  @JsonKey(name: "paged")
  final bool? paged;

  @HiveField(5)
  @JsonKey(name: "unpaged")
  final bool? unPaged;

  Pageable({this.pageNumber, this.pageSize, this.sort, this.offset, this.paged, this.unPaged});

  factory Pageable.fromJson(Map<String, dynamic> json) => _$PageableFromJson(json);

  Map<String, dynamic> toJson() => _$PageableToJson(this);
}

@HiveType(typeId: 85)
@JsonSerializable()
class Sort {
  @HiveField(0)
  @JsonKey(name: "empty")
  final bool? empty;

  @HiveField(1)
  @JsonKey(name: "sorted")
  final bool? sorted;

  @HiveField(2)
  @JsonKey(name: "unsorted")
  final bool? unsorted;

  Sort({this.empty, this.sorted, this.unsorted});

  factory Sort.fromJson(Map<String, dynamic> json) => _$SortFromJson(json);

  Map<String, dynamic> toJson() => _$SortToJson(this);
}
