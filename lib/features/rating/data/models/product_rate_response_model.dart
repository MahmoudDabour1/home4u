import 'package:json_annotation/json_annotation.dart';

part 'product_rate_response_model.g.dart';

@JsonSerializable()
class ProductRateResponseModel {
  @JsonKey(name: "success")
  bool success;
  @JsonKey(name: "status")
  int status;
  @JsonKey(name: "data")
  ProductRateData? data;

  ProductRateResponseModel({
    required this.success,
    required this.status,
    required this.data,
  });

  factory ProductRateResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ProductRateResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductRateResponseModelToJson(this);
}

@JsonSerializable()
class ProductRateData {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "statusCode")
  int statusCode;
  @JsonKey(name: "productId")
  int productId;
  @JsonKey(name: "rate")
  double? rate;
  @JsonKey(name: "comment")
  String comment;

  ProductRateData({
    required this.id,
    required this.statusCode,
    required this.productId,
    required this.rate,
    required this.comment,
  });

  factory ProductRateData.fromJson(Map<String, dynamic> json) =>
      _$ProductRateDataFromJson(json);

  Map<String, dynamic> toJson() => _$ProductRateDataToJson(this);
}
