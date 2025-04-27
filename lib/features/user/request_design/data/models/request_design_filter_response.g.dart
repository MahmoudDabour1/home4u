// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_design_filter_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestDesignFilterResponse _$RequestDesignFilterResponseFromJson(
        Map<String, dynamic> json) =>
    RequestDesignFilterResponse(
      success: json['success'] as bool?,
      status: (json['status'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : RequestFilterData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RequestDesignFilterResponseToJson(
        RequestDesignFilterResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'status': instance.status,
      'data': instance.data,
    };

RequestFilterData _$RequestFilterDataFromJson(Map<String, dynamic> json) =>
    RequestFilterData(
      content: (json['content'] as List<dynamic>?)
          ?.map((e) => RequestDesignFilterContent.fromJson(e as Map<String, dynamic>))
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

Map<String, dynamic> _$RequestFilterDataToJson(RequestFilterData instance) =>
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

RequestDesignFilterContent _$ContentFromJson(Map<String, dynamic> json) => RequestDesignFilterContent(
      id: (json['id'] as num?)?.toInt(),
      statusCode: (json['statusCode'] as num?)?.toInt(),
      phoneNumber: json['phoneNumber'] as String?,
      unitType: json['unitType'] == null
          ? null
          : UnitType.fromJson(json['unitType'] as Map<String, dynamic>),
      governorate: json['governorate'] == null
          ? null
          : Governorate.fromJson(json['governorate'] as Map<String, dynamic>),
      unitArea: (json['unitArea'] as num?)?.toInt(),
      budget: (json['budget'] as num?)?.toInt(),
      requiredDuration: (json['requiredDuration'] as num?)?.toInt(),
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$ContentToJson(RequestDesignFilterContent instance) => <String, dynamic>{
      'id': instance.id,
      'statusCode': instance.statusCode,
      'phoneNumber': instance.phoneNumber,
      'unitType': instance.unitType,
      'governorate': instance.governorate,
      'unitArea': instance.unitArea,
      'budget': instance.budget,
      'requiredDuration': instance.requiredDuration,
      'notes': instance.notes,
    };

Governorate _$GovernorateFromJson(Map<String, dynamic> json) => Governorate(
      id: (json['id'] as num?)?.toInt(),
      code: json['code'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$GovernorateToJson(Governorate instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
    };

UnitType _$UnitTypeFromJson(Map<String, dynamic> json) => UnitType(
      id: (json['id'] as num?)?.toInt(),
      code: json['code'] as String?,
      name: json['name'] as String?,
      nameAr: json['nameAr'] as String?,
      nameEn: json['nameEn'] as String?,
    );

Map<String, dynamic> _$UnitTypeToJson(UnitType instance) => <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'nameAr': instance.nameAr,
      'nameEn': instance.nameEn,
    };

Pageable _$PageableFromJson(Map<String, dynamic> json) => Pageable(
      pageNumber: (json['pageNumber'] as num?)?.toInt(),
      pageSize: (json['pageSize'] as num?)?.toInt(),
      sort: json['sort'] == null
          ? null
          : Sort.fromJson(json['sort'] as Map<String, dynamic>),
      offset: (json['offset'] as num?)?.toInt(),
      unpaged: json['unpaged'] as bool?,
      paged: json['paged'] as bool?,
    );

Map<String, dynamic> _$PageableToJson(Pageable instance) => <String, dynamic>{
      'pageNumber': instance.pageNumber,
      'pageSize': instance.pageSize,
      'sort': instance.sort,
      'offset': instance.offset,
      'unpaged': instance.unpaged,
      'paged': instance.paged,
    };

Sort _$SortFromJson(Map<String, dynamic> json) => Sort(
      empty: json['empty'] as bool?,
      unsorted: json['unsorted'] as bool?,
      sorted: json['sorted'] as bool?,
    );

Map<String, dynamic> _$SortToJson(Sort instance) => <String, dynamic>{
      'empty': instance.empty,
      'unsorted': instance.unsorted,
      'sorted': instance.sorted,
    };
