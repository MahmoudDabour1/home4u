import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_product_rate_response_model.g.dart';

@JsonSerializable()
class UpdateProductRateResponseModel {
  @JsonKey(name: "success")
  bool success;
  @JsonKey(name: "status")
  int status;
  @JsonKey(name: "data")
  UpdateProductRateData data;

  UpdateProductRateResponseModel({
    required this.success,
    required this.status,
    required this.data,
  });

  factory UpdateProductRateResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateProductRateResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateProductRateResponseModelToJson(this);
}

@JsonSerializable()
class UpdateProductRateData {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "statusCode")
  int statusCode;
  @JsonKey(name: "productId")
  int productId;
  @JsonKey(name: "rate")
  int rate;
  @JsonKey(name: "comment")
  String comment;

  UpdateProductRateData({
    required this.id,
    required this.statusCode,
    required this.productId,
    required this.rate,
    required this.comment,
  });

  factory UpdateProductRateData.fromJson(Map<String, dynamic> json) =>
      _$UpdateProductRateDataFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateProductRateDataToJson(this);
}
