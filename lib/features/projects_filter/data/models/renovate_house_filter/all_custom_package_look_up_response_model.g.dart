// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_custom_package_look_up_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllCustomPackageLookUpResponseModel
    _$AllCustomPackageLookUpResponseModelFromJson(Map<String, dynamic> json) =>
        AllCustomPackageLookUpResponseModel(
          success: json['success'] as bool?,
          status: (json['status'] as num?)?.toInt(),
          data: (json['data'] as List<dynamic>?)
              ?.map(
                  (e) => CustomPackageList.fromJson(e as Map<String, dynamic>))
              .toList(),
        );

Map<String, dynamic> _$AllCustomPackageLookUpResponseModelToJson(
        AllCustomPackageLookUpResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'status': instance.status,
      'data': instance.data,
    };

CustomPackageList _$CustomPackageListFromJson(Map<String, dynamic> json) =>
    CustomPackageList(
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

Map<String, dynamic> _$CustomPackageListToJson(CustomPackageList instance) =>
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
