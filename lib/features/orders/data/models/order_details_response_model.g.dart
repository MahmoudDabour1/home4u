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
      userId: (json['userId'] as num).toInt(),
      orderNumber: json['orderNumber'] as String,
      deliveryAddress: json['deliveryAddress'] as String,
      orderDetails: (json['orderDetails'] as List<dynamic>)
          .map((e) => OrderDetailsOfOrdersSingleItem.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      totalPrice: (json['totalPrice'] as num).toInt(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'userId': instance.userId,
      'orderNumber': instance.orderNumber,
      'deliveryAddress': instance.deliveryAddress,
      'orderDetails': instance.orderDetails,
      'totalPrice': instance.totalPrice,
    };

OrderDetailsOfOrdersSingleItem _$OrderDetailsOfOrdersSingleItemFromJson(
        Map<String, dynamic> json) =>
    OrderDetailsOfOrdersSingleItem(
      id: (json['id'] as num).toInt(),
      statusCode: json['statusCode'],
      product: Product.fromJson(json['product'] as Map<String, dynamic>),
      price: (json['price'] as num).toInt(),
      amount: (json['amount'] as num).toInt(),
    );

Map<String, dynamic> _$OrderDetailsOfOrdersSingleItemToJson(
        OrderDetailsOfOrdersSingleItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'statusCode': instance.statusCode,
      'product': instance.product,
      'price': instance.price,
      'amount': instance.amount,
    };

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      imagePath: json['mainImagePath'] as String,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'mainImagePath': instance.imagePath,
    };
