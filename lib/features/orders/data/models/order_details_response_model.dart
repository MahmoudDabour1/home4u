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

  factory OrderDetailsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailsResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderDetailsResponseModelToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "userId")
  int userId;
  @JsonKey(name: "orderNumber")
  String orderNumber;
  @JsonKey(name: "deliveryAddress")
  String deliveryAddress;
  @JsonKey(name: "orderDetails")
  List<Details> orderDetails;
  @JsonKey(name: "totalPrice")
  int totalPrice;

  Data({
    required this.userId,
    required this.orderNumber,
    required this.deliveryAddress,
    required this.orderDetails,
    required this.totalPrice,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Details {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "statusCode")
  dynamic statusCode;
  @JsonKey(name: "product")
  Product product;
  @JsonKey(name: "price")
  int price;
  @JsonKey(name: "amount")
  int amount;

  Details({
    required this.id,
    required this.statusCode,
    required this.product,
    required this.price,
    required this.amount,
  });

  factory  Details.fromJson(Map<String, dynamic> json) =>
      _$DetailsFromJson(json);

  Map<String, dynamic> toJson() => _$DetailsToJson(this);
}

@JsonSerializable()
class Product {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "mainImagePath")
  String imagePath;

  Product({
    required this.id,
    required this.name,
    required this.imagePath,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
