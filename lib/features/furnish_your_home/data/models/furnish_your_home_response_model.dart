import 'package:json_annotation/json_annotation.dart';
part 'furnish_your_home_response_model.g.dart';
@JsonSerializable()
class FurnishYourHomeResponseModel {
  @JsonKey(name: "success")
  final bool? success;
  @JsonKey(name: "status")
  final int? status;
  @JsonKey(name: "data")
  final Data? data;

  FurnishYourHomeResponseModel({
    this.success,
    this.status,
    this.data,
  });

  factory FurnishYourHomeResponseModel.fromJson(Map<String, dynamic> json) => _$FurnishYourHomeResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$FurnishYourHomeResponseModelToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "statusCode")
  final int? statusCode;
  @JsonKey(name: "requestType")
  final FurnitureType? requestType;
  @JsonKey(name: "phoneNumber")
  final String? phoneNumber;
  @JsonKey(name: "government")
  final FurnitureType? government;
  @JsonKey(name: "timeFrameDays")
  final int? timeFrameDays;
  @JsonKey(name: "budget")
  final int? budget;
  @JsonKey(name: "attachmentFileUrl")
  final dynamic attachmentFileUrl;
  @JsonKey(name: "note")
  final String? note;
  @JsonKey(name: "productMaterial")
  final dynamic productMaterial;
  @JsonKey(name: "kitchenType")
  final dynamic kitchenType;
  @JsonKey(name: "devicesAttacheds")
  final dynamic devicesAttacheds;
  @JsonKey(name: "kitchenSize")
  final dynamic kitchenSize;
  @JsonKey(name: "furnitureType")
  final FurnitureType? furnitureType;

  Data({
    this.id,
    this.statusCode,
    this.requestType,
    this.phoneNumber,
    this.government,
    this.timeFrameDays,
    this.budget,
    this.attachmentFileUrl,
    this.note,
    this.productMaterial,
    this.kitchenType,
    this.devicesAttacheds,
    this.kitchenSize,
    this.furnitureType,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class FurnitureType {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "code")
  final dynamic code;
  @JsonKey(name: "name")
  final dynamic name;

  FurnitureType({
    this.id,
    this.code,
    this.name,
  });

  factory FurnitureType.fromJson(Map<String, dynamic> json) => _$FurnitureTypeFromJson(json);

  Map<String, dynamic> toJson() => _$FurnitureTypeToJson(this);
}
