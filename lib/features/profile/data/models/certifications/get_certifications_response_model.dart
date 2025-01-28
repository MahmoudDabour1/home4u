import 'package:json_annotation/json_annotation.dart';

part 'get_certifications_response_model.g.dart';

@JsonSerializable()
class GetCertificationsResponseModel {
  bool? success;
  int? status;
  List<CertificationsData>?data;

  GetCertificationsResponseModel({this.success, this.status, this.data});
  factory GetCertificationsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GetCertificationsResponseModelFromJson(json);
}
@JsonSerializable()
class CertificationsData {
  int? id;
  int? statusCode;
  String? name;
  String? description;
  @JsonKey(name: 'path')
  String? imagePath;

  CertificationsData({
    this.id,
    this.statusCode,
    this.name,
    this.description,
    this.imagePath,
  });

  factory CertificationsData.fromJson(Map<String, dynamic> json) =>
      _$CertificationsDataFromJson(json);
}
