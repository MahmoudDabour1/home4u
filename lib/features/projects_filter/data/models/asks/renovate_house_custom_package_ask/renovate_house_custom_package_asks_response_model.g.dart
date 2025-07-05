// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'renovate_house_custom_package_asks_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RenovateHouseCustomPackageAsksResponseModel
    _$RenovateHouseCustomPackageAsksResponseModelFromJson(
            Map<String, dynamic> json) =>
        RenovateHouseCustomPackageAsksResponseModel(
          success: json['success'] as bool?,
          status: (json['status'] as num?)?.toInt(),
          data: (json['data'] as List<dynamic>?)
              ?.map((e) => RenovateHouseCustomPackageAskData.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
        );

Map<String, dynamic> _$RenovateHouseCustomPackageAsksResponseModelToJson(
        RenovateHouseCustomPackageAsksResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'status': instance.status,
      'data': instance.data,
    };

RenovateHouseCustomPackageAskData _$RenovateHouseCustomPackageAskDataFromJson(
        Map<String, dynamic> json) =>
    RenovateHouseCustomPackageAskData(
      id: (json['id'] as num?)?.toInt(),
      statusCode: (json['statusCode'] as num?)?.toInt(),
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      modifiedDate: json['modifiedDate'] == null
          ? null
          : DateTime.parse(json['modifiedDate'] as String),
      phoneNumber: json['phoneNumber'] as String?,
      isInsideCompound: json['isInsideCompound'] as bool?,
      unitType: json['unitType'] == null
          ? null
          : BaseTypeModel.fromJson(json['unitType'] as Map<String, dynamic>),
      customPackage: json['customPackage'] == null
          ? null
          : CustomPackage.fromJson(
              json['customPackage'] as Map<String, dynamic>),
      user: json['user'] == null
          ? null
          : UserBaseModel.fromJson(json['user'] as Map<String, dynamic>),
      requestCount: (json['requestCount'] as num?)?.toInt(),
      askStatus: json['askStatus'] as String?,
    );

Map<String, dynamic> _$RenovateHouseCustomPackageAskDataToJson(
        RenovateHouseCustomPackageAskData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'statusCode': instance.statusCode,
      'createdDate': instance.createdDate?.toIso8601String(),
      'modifiedDate': instance.modifiedDate?.toIso8601String(),
      'phoneNumber': instance.phoneNumber,
      'isInsideCompound': instance.isInsideCompound,
      'unitType': instance.unitType,
      'customPackage': instance.customPackage,
      'user': instance.user,
      'requestCount': instance.requestCount,
      'askStatus': instance.askStatus,
    };

CustomPackage _$CustomPackageFromJson(Map<String, dynamic> json) =>
    CustomPackage(
      id: (json['id'] as num?)?.toInt(),
      statusCode: (json['statusCode'] as num?)?.toInt(),
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      modifiedDate: json['modifiedDate'] == null
          ? null
          : DateTime.parse(json['modifiedDate'] as String),
      name: json['name'] as String?,
      nameAr: json['nameAr'] as String?,
      nameEn: json['nameEn'] as String?,
      price: (json['price'] as num?)?.toInt(),
      details: json['details'] as String?,
      detailsAr: json['detailsAr'] as String?,
      detailsEn: json['detailsEn'] as String?,
    );

Map<String, dynamic> _$CustomPackageToJson(CustomPackage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'statusCode': instance.statusCode,
      'createdDate': instance.createdDate?.toIso8601String(),
      'modifiedDate': instance.modifiedDate?.toIso8601String(),
      'name': instance.name,
      'nameAr': instance.nameAr,
      'nameEn': instance.nameEn,
      'price': instance.price,
      'details': instance.details,
      'detailsAr': instance.detailsAr,
      'detailsEn': instance.detailsEn,
    };
