// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'renovate_house_request_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RenovateHouseRequestResponseModel _$RenovateHouseRequestResponseModelFromJson(
        Map<String, dynamic> json) =>
    RenovateHouseRequestResponseModel(
      success: json['success'] as bool?,
      status: (json['status'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) =>
              RenovateHouseRequestData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RenovateHouseRequestResponseModelToJson(
        RenovateHouseRequestResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'status': instance.status,
      'data': instance.data,
    };

RenovateHouseRequestData _$RenovateHouseRequestDataFromJson(
        Map<String, dynamic> json) =>
    RenovateHouseRequestData(
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
      homeRenovate: json['homeRenovate'] == null
          ? null
          : HomeRenovate.fromJson(json['homeRenovate'] as Map<String, dynamic>),
      comment: json['comment'] as String?,
      isAccepted: json['isAccepted'],
      isFinished: json['isFinished'],
      isRejected: json['isRejected'],
    );

Map<String, dynamic> _$RenovateHouseRequestDataToJson(
        RenovateHouseRequestData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'statusCode': instance.statusCode,
      'createdDate': instance.createdDate?.toIso8601String(),
      'modifiedDate': instance.modifiedDate?.toIso8601String(),
      'user': instance.user,
      'homeRenovate': instance.homeRenovate,
      'comment': instance.comment,
      'isAccepted': instance.isAccepted,
      'isFinished': instance.isFinished,
      'isRejected': instance.isRejected,
    };

HomeRenovate _$HomeRenovateFromJson(Map<String, dynamic> json) => HomeRenovate(
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$HomeRenovateToJson(HomeRenovate instance) =>
    <String, dynamic>{
      'id': instance.id,
    };
