// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_design_request_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestDesignRequestResponseModel _$RequestDesignRequestResponseModelFromJson(
        Map<String, dynamic> json) =>
    RequestDesignRequestResponseModel(
      success: json['success'] as bool?,
      status: (json['status'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) =>
              RequestDesignRequestData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RequestDesignRequestResponseModelToJson(
        RequestDesignRequestResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'status': instance.status,
      'data': instance.data,
    };

RequestDesignRequestData _$RequestDesignRequestDataFromJson(
        Map<String, dynamic> json) =>
    RequestDesignRequestData(
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
      requestDesign: json['requestDesign'] == null
          ? null
          : RequestDesign.fromJson(
              json['requestDesign'] as Map<String, dynamic>),
      comment: json['comment'] as String?,
      isAccepted: json['isAccepted'],
      isFinished: json['isFinished'],
      isRejected: json['isRejected'],
    );

Map<String, dynamic> _$RequestDesignRequestDataToJson(
        RequestDesignRequestData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'statusCode': instance.statusCode,
      'createdDate': instance.createdDate?.toIso8601String(),
      'modifiedDate': instance.modifiedDate?.toIso8601String(),
      'user': instance.user,
      'requestDesign': instance.requestDesign,
      'comment': instance.comment,
      'isAccepted': instance.isAccepted,
      'isFinished': instance.isFinished,
      'isRejected': instance.isRejected,
    };

RequestDesign _$RequestDesignFromJson(Map<String, dynamic> json) =>
    RequestDesign(
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
      phoneNumber: json['phoneNumber'] as String?,
      unitType: json['unitType'] == null
          ? null
          : CityBaseModel.fromJson(json['unitType'] as Map<String, dynamic>),
      governorate: json['governorate'] == null
          ? null
          : CityBaseModel.fromJson(json['governorate'] as Map<String, dynamic>),
      unitArea: (json['unitArea'] as num?)?.toInt(),
      budget: (json['budget'] as num?)?.toInt(),
      requiredDuration: (json['requiredDuration'] as num?)?.toInt(),
      notes: json['notes'] as String?,
      requestCount: (json['requestCount'] as num?)?.toInt(),
      askStatus: json['askStatus'] as String?,
    );

Map<String, dynamic> _$RequestDesignToJson(RequestDesign instance) =>
    <String, dynamic>{
      'id': instance.id,
      'statusCode': instance.statusCode,
      'createdDate': instance.createdDate?.toIso8601String(),
      'modifiedDate': instance.modifiedDate?.toIso8601String(),
      'user': instance.user,
      'phoneNumber': instance.phoneNumber,
      'unitType': instance.unitType,
      'governorate': instance.governorate,
      'unitArea': instance.unitArea,
      'budget': instance.budget,
      'requiredDuration': instance.requiredDuration,
      'notes': instance.notes,
      'requestCount': instance.requestCount,
      'askStatus': instance.askStatus,
    };

Authority _$AuthorityFromJson(Map<String, dynamic> json) => Authority(
      authority: json['authority'] as String?,
    );

Map<String, dynamic> _$AuthorityToJson(Authority instance) => <String, dynamic>{
      'authority': instance.authority,
    };
