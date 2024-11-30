// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      success: json['success'] as bool?,
      statusCode: (json['status'] as num?)?.toInt(),
      userData: json['data'] == null
          ? null
          : UserData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'status': instance.statusCode,
      'data': instance.userData,
    };

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      token: json['token'] as String?,
      refreshToken: json['refreshToken'] as String?,
      userInformation: json['userInformation'] == null
          ? null
          : UserInformation.fromJson(
              json['userInformation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'token': instance.token,
      'refreshToken': instance.refreshToken,
      'userInformation': instance.userInformation,
    };

UserInformation _$UserInformationFromJson(Map<String, dynamic> json) =>
    UserInformation(
      id: (json['id'] as num?)?.toInt(),
      userName: json['username'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      userType: json['userType'] == null
          ? null
          : UserType.fromJson(json['userType'] as Map<String, dynamic>),
      statusCode: (json['statusCode'] as num?)?.toInt(),
    );

Map<String, dynamic> _$UserInformationToJson(UserInformation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'statusCode': instance.statusCode,
      'username': instance.userName,
      'email': instance.email,
      'phone': instance.phone,
      'userType': instance.userType,
    };

UserType _$UserTypeFromJson(Map<String, dynamic> json) => UserType(
      id: (json['id'] as num?)?.toInt(),
      code: json['code'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$UserTypeToJson(UserType instance) => <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
    };
