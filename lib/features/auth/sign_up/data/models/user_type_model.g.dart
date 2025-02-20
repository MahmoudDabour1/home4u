// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_type_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserTypeModel _$UserTypeModelFromJson(Map<String, dynamic> json) =>
    UserTypeModel(
      data: (json['data'] as List<dynamic>)
          .map((e) => UserTypeData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserTypeModelToJson(UserTypeModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

UserTypeData _$UserTypeDataFromJson(Map<String, dynamic> json) => UserTypeData(
      id: (json['id'] as num).toInt(),
      code: json['code'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$UserTypeDataToJson(UserTypeData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
    };
