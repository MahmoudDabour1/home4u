// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'renovate_house_fixed_package_filter_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RenovateHouseFixedPackageFilterResponseModel
    _$RenovateHouseFixedPackageFilterResponseModelFromJson(
            Map<String, dynamic> json) =>
        RenovateHouseFixedPackageFilterResponseModel(
          success: json['success'] as bool?,
          status: (json['status'] as num?)?.toInt(),
          data: json['data'] == null
              ? null
              : Data.fromJson(json['data'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$RenovateHouseFixedPackageFilterResponseModelToJson(
        RenovateHouseFixedPackageFilterResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'status': instance.status,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      content: (json['content'] as List<dynamic>?)
          ?.map((e) => RenovateHouseCustomPackageContent.fromJson(
              e as Map<String, dynamic>))
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

RenovateHouseCustomPackageContent _$RenovateHouseCustomPackageContentFromJson(
        Map<String, dynamic> json) =>
    RenovateHouseCustomPackageContent(
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

Map<String, dynamic> _$RenovateHouseCustomPackageContentToJson(
        RenovateHouseCustomPackageContent instance) =>
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
