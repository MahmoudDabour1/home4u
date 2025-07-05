// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ask_technical_request_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AskTechnicalRequestResponseModel _$AskTechnicalRequestResponseModelFromJson(
        Map<String, dynamic> json) =>
    AskTechnicalRequestResponseModel(
      success: json['success'] as bool?,
      status: (json['status'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) =>
              AskTechnicalRequestData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AskTechnicalRequestResponseModelToJson(
        AskTechnicalRequestResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'status': instance.status,
      'data': instance.data,
    };

AskTechnicalRequestData _$AskTechnicalRequestDataFromJson(
        Map<String, dynamic> json) =>
    AskTechnicalRequestData(
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
      askWorker: json['askWorker'] == null
          ? null
          : AskWorker.fromJson(json['askWorker'] as Map<String, dynamic>),
      comment: json['comment'] as String?,
      isAccepted: json['isAccepted'],
      isFinished: json['isFinished'],
      isRejected: json['isRejected'],
    );

Map<String, dynamic> _$AskTechnicalRequestDataToJson(
        AskTechnicalRequestData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'statusCode': instance.statusCode,
      'createdDate': instance.createdDate?.toIso8601String(),
      'modifiedDate': instance.modifiedDate?.toIso8601String(),
      'user': instance.user,
      'askWorker': instance.askWorker,
      'comment': instance.comment,
      'isAccepted': instance.isAccepted,
      'isFinished': instance.isFinished,
      'isRejected': instance.isRejected,
    };

AskWorker _$AskWorkerFromJson(Map<String, dynamic> json) => AskWorker(
      id: (json['id'] as num?)?.toInt(),
      statusCode: (json['statusCode'] as num?)?.toInt(),
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      modifiedDate: json['modifiedDate'] == null
          ? null
          : DateTime.parse(json['modifiedDate'] as String),
      projectName: json['projectName'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      projectDescription: json['projectDescription'] as String?,
      workerType: json['workerType'] == null
          ? null
          : BaseTypeModel.fromJson(json['workerType'] as Map<String, dynamic>),
      unitType: json['unitType'] == null
          ? null
          : BaseTypeModel.fromJson(json['unitType'] as Map<String, dynamic>),
      city: json['city'] == null
          ? null
          : CityBaseModel.fromJson(json['city'] as Map<String, dynamic>),
      governorate: json['governorate'] == null
          ? null
          : CityBaseModel.fromJson(json['governorate'] as Map<String, dynamic>),
      material: json['material'] == null
          ? null
          : CityBaseModel.fromJson(json['material'] as Map<String, dynamic>),
      budget: (json['budget'] as num?)?.toInt(),
      photos: json['photos'] as List<dynamic>?,
      user: json['user'] == null
          ? null
          : UserBaseModel.fromJson(json['user'] as Map<String, dynamic>),
      requestCount: (json['requestCount'] as num?)?.toInt(),
      askStatus: json['askStatus'] as String?,
    );

Map<String, dynamic> _$AskWorkerToJson(AskWorker instance) => <String, dynamic>{
      'id': instance.id,
      'statusCode': instance.statusCode,
      'createdDate': instance.createdDate?.toIso8601String(),
      'modifiedDate': instance.modifiedDate?.toIso8601String(),
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
      'user': instance.user,
      'requestCount': instance.requestCount,
      'askStatus': instance.askStatus,
    };
