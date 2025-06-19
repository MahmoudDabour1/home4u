import 'package:freezed_annotation/freezed_annotation.dart';

part 'orders_response_model.g.dart';

@JsonSerializable()
class OrdersResponseModel {
  @JsonKey(name: "success")
  bool success;
  @JsonKey(name: "status")
  int status;
  @JsonKey(name: "data")
  List<OrderDetails> data;

  OrdersResponseModel({
    required this.success,
    required this.status,
    required this.data,
  });

  factory OrdersResponseModel.fromJson(Map<String, dynamic> json) =>
      _$OrdersResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrdersResponseModelToJson(this);
}

@JsonSerializable()
class OrderDetails {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "orderNumber")
  String orderNumber;
  @JsonKey(name: "quantity")
  int quantity;
  @JsonKey(name: "price")
  int price;
  @JsonKey(name: "status")
  Status status;
  @JsonKey(name: "createdDate")
  DateTime createdDate;

  OrderDetails({
    required this.id,
    required this.orderNumber,
    required this.quantity,
    required this.price,
    required this.status,
    required this.createdDate,
  });

  factory OrderDetails.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$OrderDetailsToJson(this);
}

@JsonSerializable()
class Status {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "code")
  OrderStatusCode code;
  @JsonKey(name: "name")
  Name name;

  Status({
    required this.id,
    required this.code,
    required this.name,
  });

  factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);

  Map<String, dynamic> toJson() => _$StatusToJson(this);
}

enum OrderStatusCode {
  @JsonValue("PENDING")
  PENDING,
  @JsonValue("CANCELED")
  CANCELED,
  @JsonValue("DELIVERED")
  DELIVERED,
}

enum Name {
  @JsonValue("Pending")
  pending,
  @JsonValue("Canceled")
  canceled,
  @JsonValue("Delivered")
  delivered,
}
