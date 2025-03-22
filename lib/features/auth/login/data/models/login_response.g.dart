// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      success: json['success'] as bool?,
      status: (json['status'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'status': instance.status,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      token: json['token'] as String?,
      refreshToken: json['refreshToken'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'token': instance.token,
      'refreshToken': instance.refreshToken,
      'user': instance.user,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: (json['id'] as num?)?.toInt(),
      statusCode: (json['statusCode'] as num?)?.toInt(),
      username: json['username'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      userType: json['userType'] == null
          ? null
          : BaseData.fromJson(json['userType'] as Map<String, dynamic>),
      governorate: json['governorate'] == null
          ? null
          : BaseData.fromJson(json['governorate'] as Map<String, dynamic>),
      city: json['city'] == null
          ? null
          : BaseData.fromJson(json['city'] as Map<String, dynamic>),
      business: json['business'] == null
          ? null
          : Business.fromJson(json['business'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'statusCode': instance.statusCode,
      'username': instance.username,
      'email': instance.email,
      'phone': instance.phone,
      'userType': instance.userType,
      'governorate': instance.governorate,
      'city': instance.city,
      'business': instance.business,
    };

Business _$BusinessFromJson(Map<String, dynamic> json) => Business(
      businessId: json['businessId'] as String?,
      tradName: json['tradName'] as String?,
    );

Map<String, dynamic> _$BusinessToJson(Business instance) => <String, dynamic>{
      'businessId': instance.businessId,
      'tradName': instance.tradName,
    };

BaseData _$BaseDataFromJson(Map<String, dynamic> json) => BaseData(
      id: (json['id'] as num?)?.toInt(),
      code: json['code'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$BaseDataToJson(BaseData instance) => <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
    };
