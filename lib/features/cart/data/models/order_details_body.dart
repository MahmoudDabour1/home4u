import 'package:json_annotation/json_annotation.dart';

part 'order_details_body.g.dart';

@JsonSerializable()
class OrderDetailsBody {
  final double? totalPrice;
  final List<OrderDetails>? orderDetails;

  const OrderDetailsBody({
    required this.totalPrice,
    required this.orderDetails,
  });

  factory OrderDetailsBody.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailsBodyFromJson(json);

  Map<String, dynamic> toJson() => _$OrderDetailsBodyToJson(this);
}

@JsonSerializable()
class OrderDetails {
  final int? productId;
  final double? price;
  final int? amount;

  const OrderDetails({
    required this.productId,
    required this.price,
    required this.amount,
  });

  factory OrderDetails.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$OrderDetailsToJson(this);
}
