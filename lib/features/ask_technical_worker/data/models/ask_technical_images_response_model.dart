
import 'package:json_annotation/json_annotation.dart';
part 'ask_technical_images_response_model.g.dart';
@JsonSerializable()
class AskTechnicalImageResponseModel {
  @JsonKey(name: "success")
  final bool? success;
  @JsonKey(name: "status")
  final int? status;
  @JsonKey(name: "data")
  final List<Datum>? data;

  AskTechnicalImageResponseModel({
    this.success,
    this.status,
    this.data,
  });

  factory AskTechnicalImageResponseModel.fromJson(Map<String, dynamic> json) => _$AskTechnicalImageResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$AskTechnicalImageResponseModelToJson(this);
}

@JsonSerializable()
class Datum {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "askWorkerId")
  final int? askWorkerId;
  @JsonKey(name: "photoPath")
  final dynamic photoPath;

  Datum({
    this.id,
    this.askWorkerId,
    this.photoPath,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);
}
