// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_engineers_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopEngineersResponseModel _$TopEngineersResponseModelFromJson(
        Map<String, dynamic> json) =>
    TopEngineersResponseModel(
      success: json['success'] as bool?,
      status: (json['status'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TopEngineersResponseModelToJson(
        TopEngineersResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'status': instance.status,
      'data': instance.data,
    };

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
      id: (json['id'] as num?)?.toInt(),
      statusCode: (json['statusCode'] as num?)?.toInt(),
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      modifiedDate: json['modifiedDate'] == null
          ? null
          : DateTime.parse(json['modifiedDate'] as String),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      type: json['type'] == null
          ? null
          : Type.fromJson(json['type'] as Map<String, dynamic>),
      yearsOfExperience: (json['yearsOfExperience'] as num?)?.toInt(),
      engineerServ: (json['engineerServ'] as List<dynamic>?)
          ?.map((e) => Type.fromJson(e as Map<String, dynamic>))
          .toList(),
      bio: json['bio'] as String?,
      facebookLink: json['facebookLink'] as String?,
      linkedinLink: json['linkedinLink'] as String?,
      behanceLink: json['behanceLink'] as String?,
      averageRate: (json['averageRate'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
      'id': instance.id,
      'statusCode': instance.statusCode,
      'createdDate': instance.createdDate?.toIso8601String(),
      'modifiedDate': instance.modifiedDate?.toIso8601String(),
      'user': instance.user,
      'type': instance.type,
      'yearsOfExperience': instance.yearsOfExperience,
      'engineerServ': instance.engineerServ,
      'bio': instance.bio,
      'facebookLink': instance.facebookLink,
      'linkedinLink': instance.linkedinLink,
      'behanceLink': instance.behanceLink,
      'averageRate': instance.averageRate,
    };

Type _$TypeFromJson(Map<String, dynamic> json) => Type(
      id: (json['id'] as num?)?.toInt(),
      code: json['code'] as String?,
      name: json['name'] as String?,
      nameAr: json['nameAr'] as String?,
      nameEn: json['nameEn'] as String?,
    );

Map<String, dynamic> _$TypeToJson(Type instance) => <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'nameAr': instance.nameAr,
      'nameEn': instance.nameEn,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: (json['id'] as num?)?.toInt(),
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      personalPhoto: json['personalPhoto'] as String?,
      coverPhoto: json['coverPhoto'],
      userType: json['userType'] == null
          ? null
          : City.fromJson(json['userType'] as Map<String, dynamic>),
      governorate: json['governorate'] == null
          ? null
          : City.fromJson(json['governorate'] as Map<String, dynamic>),
      city: json['city'] == null
          ? null
          : City.fromJson(json['city'] as Map<String, dynamic>),
      engineer: json['engineer'],
      technicalWorker: json['technicalWorker'],
      engineeringOffice: json['engineeringOffice'],
      enabled: json['enabled'] as bool?,
      business: json['business'],
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'phone': instance.phone,
      'personalPhoto': instance.personalPhoto,
      'coverPhoto': instance.coverPhoto,
      'userType': instance.userType,
      'governorate': instance.governorate,
      'city': instance.city,
      'engineer': instance.engineer,
      'technicalWorker': instance.technicalWorker,
      'engineeringOffice': instance.engineeringOffice,
      'enabled': instance.enabled,
      'business': instance.business,
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
