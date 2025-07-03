// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_base_type_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserBaseTypeModel _$UserBaseTypeModelFromJson(Map<String, dynamic> json) =>
    UserBaseTypeModel(
      id: (json['id'] as num?)?.toInt(),
      code: json['code'],
      name: json['name'],
      nameAr: json['nameAr'],
      nameEn: json['nameEn'],
    );

Map<String, dynamic> _$UserBaseTypeModelToJson(UserBaseTypeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'nameAr': instance.nameAr,
      'nameEn': instance.nameEn,
    };
