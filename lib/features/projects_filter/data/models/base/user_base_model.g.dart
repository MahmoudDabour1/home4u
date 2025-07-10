// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_base_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserBaseModel _$UserBaseModelFromJson(Map<String, dynamic> json) =>
    UserBaseModel(
      id: (json['id'] as num?)?.toInt(),
      statusCode: (json['statusCode'] as num?)?.toInt(),
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      modifiedDate: json['modifiedDate'] == null
          ? null
          : DateTime.parse(json['modifiedDate'] as String),
      username: json['username'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      userType: json['userType'] == null
          ? null
          : BaseTypeModel.fromJson(json['userType'] as Map<String, dynamic>),
      governorate: json['governorate'] == null
          ? null
          : City.fromJson(json['governorate'] as Map<String, dynamic>),
      city: json['city'] == null
          ? null
          : City.fromJson(json['city'] as Map<String, dynamic>),
      business: json['business'] as String?,
      personalPhoto: json['personalPhoto'] as String?,
    );

Map<String, dynamic> _$UserBaseModelToJson(UserBaseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'statusCode': instance.statusCode,
      'createdDate': instance.createdDate?.toIso8601String(),
      'modifiedDate': instance.modifiedDate?.toIso8601String(),
      'username': instance.username,
      'email': instance.email,
      'phone': instance.phone,
      'userType': instance.userType,
      'governorate': instance.governorate,
      'city': instance.city,
      'business': instance.business,
      'personalPhoto': instance.personalPhoto,
    };
