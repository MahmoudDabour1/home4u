// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrdersResponseModel _$OrdersResponseModelFromJson(Map<String, dynamic> json) =>
    OrdersResponseModel(
      success: json['success'] as bool,
      status: (json['status'] as num).toInt(),
      data: (json['data'] as List<dynamic>)
          .map((e) => OrderDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrdersResponseModelToJson(
        OrdersResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'status': instance.status,
      'data': instance.data,
    };

OrderDetails _$OrderDetailsFromJson(Map<String, dynamic> json) => OrderDetails(
      id: (json['id'] as num).toInt(),
      orderNumber: json['orderNumber'] as String,
      quantity: (json['quantity'] as num).toInt(),
      price: (json['price'] as num).toInt(),
      status: Status.fromJson(json['status'] as Map<String, dynamic>),
      createdDate: DateTime.parse(json['createdDate'] as String),
    );

Map<String, dynamic> _$OrderDetailsToJson(OrderDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'orderNumber': instance.orderNumber,
      'quantity': instance.quantity,
      'price': instance.price,
      'status': instance.status,
      'createdDate': instance.createdDate.toIso8601String(),
    };

Status _$StatusFromJson(Map<String, dynamic> json) => Status(
      id: (json['id'] as num).toInt(),
      code: $enumDecode(_$CodeEnumMap, json['code']),
      name: $enumDecode(_$NameEnumMap, json['name']),
    );

Map<String, dynamic> _$StatusToJson(Status instance) => <String, dynamic>{
      'id': instance.id,
      'code': _$CodeEnumMap[instance.code]!,
      'name': _$NameEnumMap[instance.name]!,
    };

const _$CodeEnumMap = {
  OrderStatusCode.PENDING: 'PENDING',
  OrderStatusCode.CANCELED: 'CANCELED',
  OrderStatusCode.DELIVERED: 'DELIVERED',
};

const _$NameEnumMap = {
  Name.pending: 'Pending',
  Name.canceled: 'Canceled',
  Name.delivered: 'Delivered',
};
