// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'renovate_your_house_custom_packages_filter_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RenovateYourHouseCustomPackagesFilterResponse
    _$RenovateYourHouseCustomPackagesFilterResponseFromJson(
            Map<String, dynamic> json) =>
        RenovateYourHouseCustomPackagesFilterResponse(
          success: json['success'] as bool?,
          status: (json['status'] as num?)?.toInt(),
          data: json['data'] == null
              ? null
              : Data.fromJson(json['data'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$RenovateYourHouseCustomPackagesFilterResponseToJson(
        RenovateYourHouseCustomPackagesFilterResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'status': instance.status,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      content: (json['content'] as List<dynamic>?)
          ?.map(
              (e) => CustomPackagesContent.fromJson(e as Map<String, dynamic>))
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

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
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

CustomPackagesContent _$CustomPackagesContentFromJson(
        Map<String, dynamic> json) =>
    CustomPackagesContent(
      id: (json['id'] as num?)?.toInt(),
      statusCode: (json['statusCode'] as num?)?.toInt(),
      phoneNumber: json['phoneNumber'] as String?,
      isInsideCompound: json['isInsideCompound'] as bool?,
      unitType: json['unitType'] == null
          ? null
          : UnitType.fromJson(json['unitType'] as Map<String, dynamic>),
      customPackage: json['customPackage'] == null
          ? null
          : CustomPackage.fromJson(
              json['customPackage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CustomPackagesContentToJson(
        CustomPackagesContent instance) =>
    <String, dynamic>{
      'id': instance.id,
      'statusCode': instance.statusCode,
      'phoneNumber': instance.phoneNumber,
      'isInsideCompound': instance.isInsideCompound,
      'unitType': instance.unitType,
      'customPackage': instance.customPackage,
    };

CustomPackage _$CustomPackageFromJson(Map<String, dynamic> json) =>
    CustomPackage(
      id: (json['id'] as num?)?.toInt(),
      statusCode: (json['statusCode'] as num?)?.toInt(),
      name: json['name'] as String?,
      nameAr: json['nameAr'] as String?,
      nameEn: json['nameEn'] as String?,
      price: (json['price'] as num?)?.toInt(),
      details: json['details'] as String?,
      detailsAr: json['detailsAr'] as String?,
      detailsEn: json['detailsEn'] as String?,
    );

Map<String, dynamic> _$CustomPackageToJson(CustomPackage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'statusCode': instance.statusCode,
      'name': instance.name,
      'nameAr': instance.nameAr,
      'nameEn': instance.nameEn,
      'price': instance.price,
      'details': instance.details,
      'detailsAr': instance.detailsAr,
      'detailsEn': instance.detailsEn,
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
