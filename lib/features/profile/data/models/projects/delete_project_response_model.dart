import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_project_response_model.g.dart';
@JsonSerializable()
class DeleteProjectResponseModel {
  bool? success;
  int? status;
  bool? data;

  DeleteProjectResponseModel({this.success, this.status, this.data});

  factory DeleteProjectResponseModel.fromJson(Map<String, dynamic> json) =>
      _$DeleteProjectResponseModelFromJson(json);
}