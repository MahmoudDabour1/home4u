// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_now_search_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShopNowSearchBody _$ShopNowSearchBodyFromJson(Map<String, dynamic> json) =>
    ShopNowSearchBody(
      pageNumber: (json['pageNumber'] as num).toInt(),
      pageSize: (json['pageSize'] as num?)?.toInt(),
      searchCriteria: ShopNowSearchCriteria.fromJson(
          json['searchCriteria'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ShopNowSearchBodyToJson(ShopNowSearchBody instance) =>
    <String, dynamic>{
      'pageNumber': instance.pageNumber,
      'pageSize': instance.pageSize,
      'searchCriteria': instance.searchCriteria,
    };

ShopNowSearchCriteria _$ShopNowSearchCriteriaFromJson(
        Map<String, dynamic> json) =>
    ShopNowSearchCriteria(
      name: json['name'] as String?,
      materialIds: (json['materialIds'] as List<dynamic>?)
          ?.map((e) => (e as num?)?.toInt())
          .toList(),
      colorIds: (json['colorIds'] as List<dynamic>?)
          ?.map((e) => (e as num?)?.toInt())
          .toList(),
      minPrice: (json['minPrice'] as num?)?.toDouble(),
      maxPrice: (json['maxPrice'] as num?)?.toDouble(),
      businessTypeId: (json['businessTypeId'] as num?)?.toInt(),
      businessTypeCategoryId: (json['businessTypeCategoryId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ShopNowSearchCriteriaToJson(
        ShopNowSearchCriteria instance) =>
    <String, dynamic>{
      'name': instance.name,
      'materialIds': instance.materialIds,
      'colorIds': instance.colorIds,
      'minPrice': instance.minPrice,
      'maxPrice': instance.maxPrice,
      'businessTypeId': instance.businessTypeId,
      'businessTypeCategoryId': instance.businessTypeCategoryId,
    };
