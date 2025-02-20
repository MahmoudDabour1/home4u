
import 'package:json_annotation/json_annotation.dart';
part 'verification_response_model.g.dart';
@JsonSerializable()
class VerificationResponseModel {
  bool? success;
  int? status;
  String? data;

  VerificationResponseModel({this.success, this.status, this.data});
  factory VerificationResponseModel.fromJson(Map<String, dynamic> json) =>
      _$VerificationResponseModelFromJson(json);
}