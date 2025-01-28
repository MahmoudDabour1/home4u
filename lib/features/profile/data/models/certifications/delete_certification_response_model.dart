
import 'package:json_annotation/json_annotation.dart';
part 'delete_certification_response_model.g.dart';
@JsonSerializable()
class DeleteCertificationResponseModel {
  bool? success;
  int? status;
  bool? data;

  DeleteCertificationResponseModel({this.success, this.status, this.data,});

  factory DeleteCertificationResponseModel.fromJson(Map<String, dynamic> json) =>
      _$DeleteCertificationResponseModelFromJson(json);
}