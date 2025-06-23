// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insert_product_rate_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InsertProductRateResponseModel _$InsertProductRateResponseModelFromJson(
        Map<String, dynamic> json) =>
    InsertProductRateResponseModel(
      success: json['success'] as bool,
      status: (json['status'] as num).toInt(),
      data:
          InsertProductRateData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InsertProductRateResponseModelToJson(
        InsertProductRateResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'status': instance.status,
      'data': instance.data,
    };

InsertProductRateData _$InsertProductRateDataFromJson(
        Map<String, dynamic> json) =>
    InsertProductRateData(
      id: (json['id'] as num).toInt(),
      statusCode: (json['statusCode'] as num).toInt(),
      productId: (json['productId'] as num).toInt(),
      rate: (json['rate'] as num).toDouble(),
      comment: json['comment'] as String,
    );

Map<String, dynamic> _$InsertProductRateDataToJson(
        InsertProductRateData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'statusCode': instance.statusCode,
      'productId': instance.productId,
      'rate': instance.rate,
      'comment': instance.comment,
    };
