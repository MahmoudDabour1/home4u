// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'engineer_asks_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EngineerAsksResponseModel _$EngineerAsksResponseModelFromJson(
        Map<String, dynamic> json) =>
    EngineerAsksResponseModel(
      success: json['success'] as bool?,
      status: (json['status'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => AskEngineerData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EngineerAsksResponseModelToJson(
        EngineerAsksResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'status': instance.status,
      'data': instance.data,
    };

AskEngineerData _$AskEngineerDataFromJson(Map<String, dynamic> json) =>
    AskEngineerData(
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
      askEngineer: json['askEngineer'] == null
          ? null
          : AskEngineer.fromJson(json['askEngineer'] as Map<String, dynamic>),
      comment: json['comment'] as String?,
      isAccepted: json['isAccepted'],
      isFinished: json['isFinished'],
      isRejected: json['isRejected'],
    );

Map<String, dynamic> _$AskEngineerDataToJson(AskEngineerData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'statusCode': instance.statusCode,
      'createdDate': instance.createdDate?.toIso8601String(),
      'modifiedDate': instance.modifiedDate?.toIso8601String(),
      'user': instance.user,
      'askEngineer': instance.askEngineer,
      'comment': instance.comment,
      'isAccepted': instance.isAccepted,
      'isFinished': instance.isFinished,
      'isRejected': instance.isRejected,
    };

EngineerAsk _$EngineerAskFromJson(Map<String, dynamic> json) => EngineerAsk(
      id: (json['id'] as num?)?.toInt(),
      statusCode: (json['statusCode'] as num?)?.toInt(),
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      modifiedDate: json['modifiedDate'] == null
          ? null
          : DateTime.parse(json['modifiedDate'] as String),
      phoneNumber: json['phoneNumber'] as String?,
      projectName: json['projectName'] as String?,
      projectDescription: json['projectDescription'] as String?,
      engineerType: json['engineerType'] == null
          ? null
          : BaseTypeModel.fromJson(
              json['engineerType'] as Map<String, dynamic>),
      unitType: json['unitType'] == null
          ? null
          : BaseTypeModel.fromJson(json['unitType'] as Map<String, dynamic>),
      budget: (json['budget'] as num?)?.toInt(),
      city: json['city'] == null
          ? null
          : CityBaseModel.fromJson(json['city'] as Map<String, dynamic>),
      governorate: json['governorate'] == null
          ? null
          : CityBaseModel.fromJson(json['governorate'] as Map<String, dynamic>),
      urgencyLevel: json['urgencyLevel'] == null
          ? null
          : BaseTypeModel.fromJson(
              json['urgencyLevel'] as Map<String, dynamic>),
      deadline: json['deadline'] == null
          ? null
          : DateTime.parse(json['deadline'] as String),
      photos: (json['photos'] as List<dynamic>?)
          ?.map((e) => PhotoBaseModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      user: json['user'] == null
          ? null
          : UserBaseModel.fromJson(json['user'] as Map<String, dynamic>),
      requestCount: (json['requestCount'] as num?)?.toInt(),
      askStatus: json['askStatus'] as String?,
    );

Map<String, dynamic> _$EngineerAskToJson(EngineerAsk instance) =>
    <String, dynamic>{
      'id': instance.id,
      'statusCode': instance.statusCode,
      'createdDate': instance.createdDate?.toIso8601String(),
      'modifiedDate': instance.modifiedDate?.toIso8601String(),
      'phoneNumber': instance.phoneNumber,
      'projectName': instance.projectName,
      'projectDescription': instance.projectDescription,
      'engineerType': instance.engineerType,
      'unitType': instance.unitType,
      'budget': instance.budget,
      'city': instance.city,
      'governorate': instance.governorate,
      'urgencyLevel': instance.urgencyLevel,
      'deadline': instance.deadline?.toIso8601String(),
      'photos': instance.photos,
      'user': instance.user,
      'requestCount': instance.requestCount,
      'askStatus': instance.askStatus,
    };
