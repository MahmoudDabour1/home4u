// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ask_engineer_filter_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AskEngineerFilterResponseModel _$AskEngineerFilterResponseModelFromJson(
        Map<String, dynamic> json) =>
    AskEngineerFilterResponseModel(
      success: json['success'] as bool?,
      status: (json['status'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AskEngineerFilterResponseModelToJson(
        AskEngineerFilterResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'status': instance.status,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      content: (json['content'] as List<dynamic>?)
          ?.map((e) => AskEngineerContent.fromJson(e as Map<String, dynamic>))
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

AskEngineerContent _$AskEngineerContentFromJson(Map<String, dynamic> json) =>
    AskEngineerContent(
      id: (json['id'] as num?)?.toInt(),
      statusCode: (json['statusCode'] as num?)?.toInt(),
      phoneNumber: json['phoneNumber'] as String?,
      projectName: json['projectName'] as String?,
      projectDescription: json['projectDescription'] as String?,
      engineerType: json['engineerType'] == null
          ? null
          : EngineerType.fromJson(json['engineerType'] as Map<String, dynamic>),
      unitType: json['unitType'] == null
          ? null
          : EngineerType.fromJson(json['unitType'] as Map<String, dynamic>),
      budget: (json['budget'] as num?)?.toInt(),
      city: json['city'] == null
          ? null
          : City.fromJson(json['city'] as Map<String, dynamic>),
      governorate: json['governorate'] == null
          ? null
          : City.fromJson(json['governorate'] as Map<String, dynamic>),
      urgencyLevel: json['urgencyLevel'] == null
          ? null
          : EngineerType.fromJson(json['urgencyLevel'] as Map<String, dynamic>),
      deadline: json['deadline'] == null
          ? null
          : DateTime.parse(json['deadline'] as String),
      photos: (json['photos'] as List<dynamic>?)
          ?.map((e) => Photo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AskEngineerContentToJson(AskEngineerContent instance) =>
    <String, dynamic>{
      'id': instance.id,
      'statusCode': instance.statusCode,
      'phoneNumber': instance.phoneNumber,
      'projectName': instance.projectName,
      'projectDescription': instance.projectDescription,
      'engineerType': instance.engineerType,
      'unitType': instance.unitType,
      'budget': instance.budget,
      'city': instance.city,
      'governorate': instance.governorate,
      'urgencyLevel': instance.urgencyLevel,
      'deadline': instance.deadline?.toIso8601String(),
      'photos': instance.photos,
    };

City _$CityFromJson(Map<String, dynamic> json) => City(
      id: (json['id'] as num?)?.toInt(),
      code: json['code'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$CityToJson(City instance) => <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
    };

EngineerType _$EngineerTypeFromJson(Map<String, dynamic> json) => EngineerType(
      id: (json['id'] as num?)?.toInt(),
      code: json['code'] as String?,
      name: json['name'] as String?,
      nameAr: json['nameAr'] as String?,
      nameEn: json['nameEn'] as String?,
    );

Map<String, dynamic> _$EngineerTypeToJson(EngineerType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'nameAr': instance.nameAr,
      'nameEn': instance.nameEn,
    };

Photo _$PhotoFromJson(Map<String, dynamic> json) => Photo(
      id: (json['id'] as num?)?.toInt(),
      askEngineerId: (json['askEngineerId'] as num?)?.toInt(),
      photoPath: json['photoPath'] as String?,
    );

Map<String, dynamic> _$PhotoToJson(Photo instance) => <String, dynamic>{
      'id': instance.id,
      'askEngineerId': instance.askEngineerId,
      'photoPath': instance.photoPath,
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
