// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'renovate_house_custom_package_request_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RenovateHouseCustomPackageRequestResponseModel
    _$RenovateHouseCustomPackageRequestResponseModelFromJson(
            Map<String, dynamic> json) =>
        RenovateHouseCustomPackageRequestResponseModel(
          success: json['success'] as bool?,
          status: (json['status'] as num?)?.toInt(),
          data: (json['data'] as List<dynamic>?)
              ?.map((e) => RenovateHouseCustomPackageRequestData.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
        );

Map<String, dynamic> _$RenovateHouseCustomPackageRequestResponseModelToJson(
        RenovateHouseCustomPackageRequestResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'status': instance.status,
      'data': instance.data,
    };

RenovateHouseCustomPackageRequestData
    _$RenovateHouseCustomPackageRequestDataFromJson(
            Map<String, dynamic> json) =>
        RenovateHouseCustomPackageRequestData(
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
              : UserBaseModel.fromJson(json['user'] as Map<String, dynamic>),
          selectCustomPackage: json['selectCustomPackage'] == null
              ? null
              : SelectCustomPackage.fromJson(
                  json['selectCustomPackage'] as Map<String, dynamic>),
          comment: json['comment'] as String?,
          isAccepted: json['isAccepted'],
          isFinished: json['isFinished'],
          isRejected: json['isRejected'],
        );

Map<String, dynamic> _$RenovateHouseCustomPackageRequestDataToJson(
        RenovateHouseCustomPackageRequestData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'statusCode': instance.statusCode,
      'createdDate': instance.createdDate?.toIso8601String(),
      'modifiedDate': instance.modifiedDate?.toIso8601String(),
      'user': instance.user,
      'selectCustomPackage': instance.selectCustomPackage,
      'comment': instance.comment,
      'isAccepted': instance.isAccepted,
      'isFinished': instance.isFinished,
      'isRejected': instance.isRejected,
    };

SelectCustomPackage _$SelectCustomPackageFromJson(Map<String, dynamic> json) =>
    SelectCustomPackage(
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SelectCustomPackageToJson(
        SelectCustomPackage instance) =>
    <String, dynamic>{
      'id': instance.id,
    };
