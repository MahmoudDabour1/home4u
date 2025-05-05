import 'package:json_annotation/json_annotation.dart';

part 'shop_now_search_body.g.dart';

@JsonSerializable()
class ShopNowSearchBody {
  final int pageNum;
  final int? pageSize;
  final ShopNowSearchCriteria searchCriteria;

  ShopNowSearchBody({
    required this.pageNum,
    this.pageSize,
    required this.searchCriteria,
  });

  factory ShopNowSearchBody.fromJson(Map<String, dynamic> json) =>
      _$ShopNowSearchBodyFromJson(json);

  Map<String, dynamic> toJson() => _$ShopNowSearchBodyToJson(this);
}

@JsonSerializable()
class ShopNowSearchCriteria {
  final String? name;
  final List<int>? materialIds;
  final List<int>? colorIds;
  final int? minPrice;
  final int? maxPrice;
  final int? businessTypeId;
  final int? businessTypeCategoryId;

  ShopNowSearchCriteria({
    this.name,
    this.materialIds,
    this.colorIds,
    this.minPrice,
    this.maxPrice,
    this.businessTypeId,
    this.businessTypeCategoryId,
  });

  factory ShopNowSearchCriteria.fromJson(Map<String, dynamic> json) =>
      _$ShopNowSearchCriteriaFromJson(json);

  Map<String, dynamic> toJson() => _$ShopNowSearchCriteriaToJson(this);
}
