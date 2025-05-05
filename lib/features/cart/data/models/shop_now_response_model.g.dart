// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_now_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShopNowResponseModel _$ShopNowResponseModelFromJson(
        Map<String, dynamic> json) =>
    ShopNowResponseModel(
      success: json['success'] as bool?,
      status: (json['status'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : ShopNowData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ShopNowResponseModelToJson(
        ShopNowResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'status': instance.status,
      'data': instance.data,
    };

ShopNowData _$ShopNowDataFromJson(Map<String, dynamic> json) => ShopNowData(
      content: (json['content'] as List<dynamic>?)
          ?.map((e) => ShopNowContent.fromJson(e as Map<String, dynamic>))
          .toList(),
      pageable: json['pageable'] == null
          ? null
          : Pageable.fromJson(json['pageable'] as Map<String, dynamic>),
      totalPages: (json['totalPages'] as num?)?.toInt(),
      totalElements: (json['totalElements'] as num?)?.toInt(),
      last: json['last'] as bool?,
      size: (json['size'] as num?)?.toInt(),
      number: (json['number'] as num?)?.toInt(),
      sort: json['sort'] == null
          ? null
          : Sort.fromJson(json['sort'] as Map<String, dynamic>),
      numberOfElements: (json['numberOfElements'] as num?)?.toInt(),
      first: json['first'] as bool?,
      empty: json['empty'] as bool?,
    );

Map<String, dynamic> _$ShopNowDataToJson(ShopNowData instance) =>
    <String, dynamic>{
      'content': instance.content,
      'pageable': instance.pageable,
      'totalPages': instance.totalPages,
      'totalElements': instance.totalElements,
      'last': instance.last,
      'size': instance.size,
      'number': instance.number,
      'sort': instance.sort,
      'numberOfElements': instance.numberOfElements,
      'first': instance.first,
      'empty': instance.empty,
    };

ShopNowContent _$ShopNowContentFromJson(Map<String, dynamic> json) =>
    ShopNowContent(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      price: (json['price'] as num?)?.toInt(),
      imagePath: json['imagePath'] as String?,
      rate: (json['rate'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ShopNowContentToJson(ShopNowContent instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'imagePath': instance.imagePath,
      'rate': instance.rate,
    };

Pageable _$PageableFromJson(Map<String, dynamic> json) => Pageable(
      pageNumber: (json['pageNumber'] as num?)?.toInt(),
      pageSize: (json['pageSize'] as num?)?.toInt(),
      sort: json['sort'] == null
          ? null
          : Sort.fromJson(json['sort'] as Map<String, dynamic>),
      offset: (json['offset'] as num?)?.toInt(),
      paged: json['paged'] as bool?,
      unpaged: json['unpaged'] as bool?,
    );

Map<String, dynamic> _$PageableToJson(Pageable instance) => <String, dynamic>{
      'pageNumber': instance.pageNumber,
      'pageSize': instance.pageSize,
      'sort': instance.sort,
      'offset': instance.offset,
      'paged': instance.paged,
      'unpaged': instance.unpaged,
    };

Sort _$SortFromJson(Map<String, dynamic> json) => Sort(
      empty: json['empty'] as bool?,
      sorted: json['sorted'] as bool?,
      unsorted: json['unsorted'] as bool?,
    );

Map<String, dynamic> _$SortToJson(Sort instance) => <String, dynamic>{
      'empty': instance.empty,
      'sorted': instance.sorted,
      'unsorted': instance.unsorted,
    };
