import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_details_response_model.g.dart';

@JsonSerializable()
class OrderDetailsResponseModel {
  @JsonKey(name: "success")
  bool success;
  @JsonKey(name: "status")
  int status;
  @JsonKey(name: "data")
  Data data;

  OrderDetailsResponseModel({
    required this.success,
    required this.status,
    required this.data,
  });

  factory OrderDetailsResponseModel.fromJson(Map<String, dynamic> json) => _$OrderDetailsResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderDetailsResponseModelToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "statusCode")
  int statusCode;
  @JsonKey(name: "userId")
  int userId;
  @JsonKey(name: "orderNumber")
  String orderNumber;
  @JsonKey(name: "orderDetails")
  List<OrderDetail> orderDetails;

  Data({
    required this.id,
    required this.statusCode,
    required this.userId,
    required this.orderNumber,
    required this.orderDetails,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class OrderDetail {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "statusCode")
  dynamic statusCode;
  @JsonKey(name: "productId")
  int productId;
  @JsonKey(name: "amount")
  int amount;

  OrderDetail({
    required this.id,
    required this.statusCode,
    required this.productId,
    required this.amount,
  });

  factory OrderDetail.fromJson(Map<String, dynamic> json) => _$OrderDetailFromJson(json);

  Map<String, dynamic> toJson() => _$OrderDetailToJson(this);
}
