import 'package:json_annotation/json_annotation.dart';

part 'order_details_response.g.dart';

@JsonSerializable()
class OrderDetailsResponse {
  final bool? success;
  final int? status;
  final Data? data;

  const OrderDetailsResponse({
    this.success,
    this.status,
    this.data,
  });

  factory OrderDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OrderDetailsResponseToJson(this);
}

@JsonSerializable()
class Data {
  final int? id;
  final int? statusCode;
  final int? userId;
  final String? orderNumber;
  final List<OrderDetails>? orderDetails;

  const Data({
    this.id,
    this.statusCode,
    this.userId,
    this.orderNumber,
    this.orderDetails,
  });

  factory Data.fromJson(Map<String, dynamic> json) =>
      _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class OrderDetails {
  final int? id;
  final int? productId;
  final int? amount;

  const OrderDetails({
    this.id,
    this.productId,
    this.amount,
  });

  factory OrderDetails.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$OrderDetailsToJson(this);
}
