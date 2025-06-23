import 'package:json_annotation/json_annotation.dart';

part'insert_product_rate_response_model.g.dart';

@JsonSerializable()
class InsertProductRateResponseModel {
  @JsonKey(name: "success")
  bool success;
  @JsonKey(name: "status")
  int status;
  @JsonKey(name: "data")
  InsertProductRateData data;

  InsertProductRateResponseModel({
    required this.success,
    required this.status,
    required this.data,
  });

  factory InsertProductRateResponseModel.fromJson(Map<String, dynamic> json) => _$InsertProductRateResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$InsertProductRateResponseModelToJson(this);
}

@JsonSerializable()
class InsertProductRateData {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "statusCode")
  int statusCode;
  @JsonKey(name: "productId")
  int productId;
  @JsonKey(name: "rate")
  double rate;
  @JsonKey(name: "comment")
  String comment;

  InsertProductRateData({
    required this.id,
    required this.statusCode,
    required this.productId,
    required this.rate,
    required this.comment,
  });

  factory InsertProductRateData.fromJson(Map<String, dynamic> json) => _$InsertProductRateDataFromJson(json);

  Map<String, dynamic> toJson() => _$InsertProductRateDataToJson(this);

}
