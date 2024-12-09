// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpBody _$SignUpBodyFromJson(Map<String, dynamic> json) => SignUpBody(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      password: json['password'] as String,
      userType:
          UserTypeRequest.fromJson(json['userType'] as Map<String, dynamic>),
      governorate: json['governorate'] == null
          ? null
          : GovernorateRequest.fromJson(
              json['governorate'] as Map<String, dynamic>),
      city: json['city'] == null
          ? null
          : CityRequest.fromJson(json['city'] as Map<String, dynamic>),
      engineer: json['engineer'] == null
          ? null
          : EngineerRequest.fromJson(json['engineer'] as Map<String, dynamic>),
      technicalWorker: json['technicalWorker'] == null
          ? null
          : TechnicalWorkerRequest.fromJson(
              json['technicalWorker'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SignUpBodyToJson(SignUpBody instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'phone': instance.phone,
      'password': instance.password,
      'userType': instance.userType,
      'governorate': instance.governorate,
      'city': instance.city,
      'engineer': instance.engineer,
      'technicalWorker': instance.technicalWorker,
    };

UserTypeRequest _$UserTypeRequestFromJson(Map<String, dynamic> json) =>
    UserTypeRequest(
      id: (json['id'] as num).toInt(),
      code: json['code'] as String,
    );

Map<String, dynamic> _$UserTypeRequestToJson(UserTypeRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
    };

GovernorateRequest _$GovernorateRequestFromJson(Map<String, dynamic> json) =>
    GovernorateRequest(
      id: (json['id'] as num).toInt(),
    );

Map<String, dynamic> _$GovernorateRequestToJson(GovernorateRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

CityRequest _$CityRequestFromJson(Map<String, dynamic> json) => CityRequest(
      id: (json['id'] as num).toInt(),
    );

Map<String, dynamic> _$CityRequestToJson(CityRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
    };
