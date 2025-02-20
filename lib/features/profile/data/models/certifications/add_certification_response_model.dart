
import 'package:json_annotation/json_annotation.dart';
part 'add_certification_response_model.g.dart';
@JsonSerializable()
class AddCertificationResponseModel {
  bool? success;
  int? status;
  AddCertificationResponseData? data;
  AddCertificationResponseModel({
    this.success,
    this.status,
    this.data,
  });
  factory AddCertificationResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AddCertificationResponseModelFromJson(json);
}
@JsonSerializable()
class AddCertificationResponseData {
  int? id;
  int? statusCode;
  String? name;
  String? description;
  @JsonKey(name: 'path')
  String? imagePath;
  AddCertificationResponseData({
    this.id,
    this.name,
    this.description,
    this.imagePath,
  });
  factory AddCertificationResponseData.fromJson(Map<String, dynamic> json) =>
      _$AddCertificationResponseDataFromJson(json);


}