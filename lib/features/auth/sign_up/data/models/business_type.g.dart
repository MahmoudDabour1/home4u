// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BusinessTypesModel _$BusinessTypesModelFromJson(Map<String, dynamic> json) =>
    BusinessTypesModel(
      success: json['success'] as bool,
      status: (json['status'] as num).toInt(),
      data: (json['data'] as List<dynamic>)
          .map((e) => BaseData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BusinessTypesModelToJson(BusinessTypesModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'status': instance.status,
      'data': instance.data,
    };

BaseData _$BaseDataFromJson(Map<String, dynamic> json) => BaseData(
      id: (json['id'] as num).toInt(),
      code: json['code'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$BaseDataToJson(BaseData instance) => <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
    };
