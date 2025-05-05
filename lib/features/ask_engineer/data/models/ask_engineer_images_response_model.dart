
import 'package:json_annotation/json_annotation.dart';

part 'ask_engineer_images_response_model.g.dart';

@JsonSerializable()
class AskEngineerImagesResponseModel {
  @JsonKey(name: "success")
  final bool? success;
  @JsonKey(name: "status")
  final int? status;
  @JsonKey(name: "data")
  final List<Datum>? data;

  AskEngineerImagesResponseModel({
    this.success,
    this.status,
    this.data,
  });

  factory AskEngineerImagesResponseModel.fromJson(Map<String, dynamic> json) => _$AskEngineerImagesResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$AskEngineerImagesResponseModelToJson(this);
}

@JsonSerializable()
class Datum {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "askEngineerId")
  final int? askEngineerId;
  @JsonKey(name: "photoPath")
  final dynamic photoPath;

  Datum({
    this.id,
    this.askEngineerId,
    this.photoPath,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);
}
