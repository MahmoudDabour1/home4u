// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_product_rate_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateProductRateResponseModel _$UpdateProductRateResponseModelFromJson(
        Map<String, dynamic> json) =>
    UpdateProductRateResponseModel(
      success: json['success'] as bool,
      status: (json['status'] as num).toInt(),
      data:
          UpdateProductRateData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UpdateProductRateResponseModelToJson(
        UpdateProductRateResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'status': instance.status,
      'data': instance.data,
    };

UpdateProductRateData _$UpdateProductRateDataFromJson(
        Map<String, dynamic> json) =>
    UpdateProductRateData(
      id: (json['id'] as num).toInt(),
      statusCode: (json['statusCode'] as num).toInt(),
      productId: (json['productId'] as num).toInt(),
      rate: (json['rate'] as num).toInt(),
      comment: json['comment'] as String,
    );

Map<String, dynamic> _$UpdateProductRateDataToJson(
        UpdateProductRateData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'statusCode': instance.statusCode,
      'productId': instance.productId,
      'rate': instance.rate,
      'comment': instance.comment,
    };
