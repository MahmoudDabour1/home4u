
import 'package:json_annotation/json_annotation.dart';
part 'new_password_response_model.g.dart';
@JsonSerializable()
class  NewPasswordResponseModel {
  bool? success;
  int? status;
  String? data;

  NewPasswordResponseModel({this.success, this.status, this.data});
  factory NewPasswordResponseModel.fromJson(Map<String, dynamic> json) =>
      _$NewPasswordResponseModelFromJson(json);
}