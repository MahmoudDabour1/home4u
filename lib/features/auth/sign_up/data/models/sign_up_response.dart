import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_response.g.dart';

@JsonSerializable()
class SignUpResponse {
  @JsonKey(name: "success")
  bool? success;
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "data")
  Data? data;

  SignUpResponse({
    this.success,
    this.status,
    this.data,
  });

  factory SignUpResponse.fromJson(Map<String, dynamic> json) =>
      _$SignUpResponseFromJson(json);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "id")
  dynamic id;
  @JsonKey(name: "message")
  String? message;

  Data({
    this.id,
    this.message,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
