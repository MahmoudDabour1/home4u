import 'package:json_annotation/json_annotation.dart';

part 'forget_password_model.g.dart';

@JsonSerializable()
class ForgetPasswordResponseModel {
   bool? success;
   int? status;
   String? data;

   ForgetPasswordResponseModel({this.success, this.status, this.data});

  factory ForgetPasswordResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ForgetPasswordResponseModelFromJson(json);
}
