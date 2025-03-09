import 'package:json_annotation/json_annotation.dart';

part 'upload_image_response.g.dart';

@JsonSerializable()
class UploadImageResponse {
  @JsonKey(name: "success")
  final bool success;
  @JsonKey(name: "status")
  final int status;
  @JsonKey(name: "data")
  final UploadImageData data;

  UploadImageResponse({
    required this.success,
    required this.status,
    required this.data,
  });

  factory UploadImageResponse.fromJson(Map<String, dynamic> json) =>
      _$UploadImageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UploadImageResponseToJson(this);

}

@JsonSerializable()
class UploadImageData {
  @JsonKey(name: "fileName")
  final String fileName;
  @JsonKey(name: "fileDownloadUri")
  final String fileDownloadUri;
  @JsonKey(name: "type")
  final String type;
  @JsonKey(name: "size")
  final int size;
  @JsonKey(name: "relatedTo")
  final String relatedTo;
  @JsonKey(name: "relatedId")
  final int relatedId;
  @JsonKey(name: "imagePath")
  final String imagePath;

  UploadImageData({
    required this.fileName,
    required this.fileDownloadUri,
    required this.type,
    required this.size,
    required this.relatedTo,
    required this.relatedId,
    required this.imagePath,
  });

  factory UploadImageData.fromJson(Map<String, dynamic> json) =>
      _$UploadImageDataFromJson(json);

  Map<String, dynamic> toJson() => _$UploadImageDataToJson(this);
}
