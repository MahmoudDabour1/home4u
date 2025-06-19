// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_details_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderDetailsResponseModel _$OrderDetailsResponseModelFromJson(
        Map<String, dynamic> json) =>
    OrderDetailsResponseModel(
      success: json['success'] as bool,
      status: (json['status'] as num).toInt(),
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrderDetailsResponseModelToJson(
        OrderDetailsResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'status': instance.status,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: (json['id'] as num).toInt(),
      statusCode: (json['statusCode'] as num).toInt(),
      userId: (json['userId'] as num).toInt(),
      orderNumber: json['orderNumber'] as String,
      orderDetails: (json['orderDetails'] as List<dynamic>)
          .map((e) => OrderDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'statusCode': instance.statusCode,
      'userId': instance.userId,
      'orderNumber': instance.orderNumber,
      'orderDetails': instance.orderDetails,
    };

OrderDetail _$OrderDetailFromJson(Map<String, dynamic> json) => OrderDetail(
      id: (json['id'] as num).toInt(),
      statusCode: json['statusCode'],
      productId: (json['productId'] as num).toInt(),
      amount: (json['amount'] as num).toInt(),
    );

Map<String, dynamic> _$OrderDetailToJson(OrderDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'statusCode': instance.statusCode,
      'productId': instance.productId,
      'amount': instance.amount,
    };
