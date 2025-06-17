// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_details_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderDetailsBody _$OrderDetailsBodyFromJson(Map<String, dynamic> json) =>
    OrderDetailsBody(
      orderDetails: (json['orderDetails'] as List<dynamic>?)
          ?.map((e) => OrderDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrderDetailsBodyToJson(OrderDetailsBody instance) =>
    <String, dynamic>{
      'orderDetails': instance.orderDetails,
    };

OrderDetails _$OrderDetailsFromJson(Map<String, dynamic> json) => OrderDetails(
      productId: (json['productId'] as num?)?.toInt(),
      amount: (json['amount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$OrderDetailsToJson(OrderDetails instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'amount': instance.amount,
    };
