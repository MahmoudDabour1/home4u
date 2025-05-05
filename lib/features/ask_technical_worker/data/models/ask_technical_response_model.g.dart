// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ask_technical_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AskTechnicalResponseModel _$AskTechnicalResponseModelFromJson(
        Map<String, dynamic> json) =>
    AskTechnicalResponseModel(
      success: json['success'] as bool?,
      status: (json['status'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AskTechnicalResponseModelToJson(
        AskTechnicalResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'status': instance.status,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: (json['id'] as num?)?.toInt(),
      statusCode: (json['statusCode'] as num?)?.toInt(),
      projectName: json['projectName'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      projectDescription: json['projectDescription'] as String?,
      workerType: json['workerType'] == null
          ? null
          : Type.fromJson(json['workerType'] as Map<String, dynamic>),
      unitType: json['unitType'] == null
          ? null
          : Type.fromJson(json['unitType'] as Map<String, dynamic>),
      city: json['city'] == null
          ? null
          : City.fromJson(json['city'] as Map<String, dynamic>),
      governorate: json['governorate'] == null
          ? null
          : City.fromJson(json['governorate'] as Map<String, dynamic>),
      material: json['material'] == null
          ? null
          : City.fromJson(json['material'] as Map<String, dynamic>),
      budget: (json['budget'] as num?)?.toInt(),
      photos: json['photos'],
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'statusCode': instance.statusCode,
      'projectName': instance.projectName,
      'phoneNumber': instance.phoneNumber,
      'projectDescription': instance.projectDescription,
      'workerType': instance.workerType,
      'unitType': instance.unitType,
      'city': instance.city,
      'governorate': instance.governorate,
      'material': instance.material,
      'budget': instance.budget,
      'photos': instance.photos,
    };

City _$CityFromJson(Map<String, dynamic> json) => City(
      id: (json['id'] as num?)?.toInt(),
      code: json['code'],
      name: json['name'],
    );

Map<String, dynamic> _$CityToJson(City instance) => <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
    };

Type _$TypeFromJson(Map<String, dynamic> json) => Type(
      id: (json['id'] as num?)?.toInt(),
      code: json['code'],
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
