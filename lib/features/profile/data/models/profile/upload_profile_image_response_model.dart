
import 'package:json_annotation/json_annotation.dart';
part 'upload_profile_image_response_model.g.dart';

@JsonSerializable()
class UploadProfileImageResponseModel {
  bool? success;
  int? status;
  bool? data;

  UploadProfileImageResponseModel({this.success, this.status, this.data});

  factory UploadProfileImageResponseModel.fromJson(Map<String, dynamic> json) => _$UploadProfileImageResponseModelFromJson(json);
Map<String, dynamic> toJson() => _$UploadProfileImageResponseModelToJson(this);
}