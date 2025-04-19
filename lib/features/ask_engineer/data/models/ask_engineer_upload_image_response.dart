
import 'package:json_annotation/json_annotation.dart';

part 'ask_engineer_upload_image_response.g.dart';
@JsonSerializable()
class AskEngineerUploadImageResponse {
  @JsonKey(name: "success")
  final bool? success;
  @JsonKey(name: "status")
  final int? status;
  @JsonKey(name: "data")
  final Data? data;

  AskEngineerUploadImageResponse({
    this.success,
    this.status,
    this.data,
  });

  factory AskEngineerUploadImageResponse.fromJson(Map<String, dynamic> json) => _$AskEngineerUploadImageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AskEngineerUploadImageResponseToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "fileName")
  final String? fileName;
  @JsonKey(name: "fileDownloadUri")
  final String? fileDownloadUri;
  @JsonKey(name: "type")
  final String? type;
  @JsonKey(name: "size")
  final int? size;
  @JsonKey(name: "relatedTo")
  final String? relatedTo;
  @JsonKey(name: "relatedId")
  final int? relatedId;
  @JsonKey(name: "imagePath")
  final String? imagePath;

  Data({
    this.fileName,
    this.fileDownloadUri,
    this.type,
    this.size,
    this.relatedTo,
    this.relatedId,
    this.imagePath,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
