import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  @JsonKey(name: "success")
  bool? success;
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "data")
  Data? data;

  LoginResponse({
    this.success,
    this.status,
    this.data,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "token")
  String? token;
  @JsonKey(name: "refreshToken")
  String? refreshToken;
  @JsonKey(name: "user")
  User? user;

  Data({
    this.token,
    this.refreshToken,
    this.user,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class User {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "statusCode")
  int? statusCode;
  @JsonKey(name: "username")
  String? username;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "phone")
  String? phone;
  @JsonKey(name: "userType")
  BaseData? userType;
  @JsonKey(name: "governorate")
  BaseData? governorate;
  @JsonKey(name: "city")
  BaseData? city;
  @JsonKey(name: "business")
  Business? business;

  User({
    this.id,
    this.statusCode,
    this.username,
    this.email,
    this.phone,
    this.userType,
    this.governorate,
    this.city,
    this.business,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

}

@JsonSerializable()
class Business {
  @JsonKey(name: "businessId")
  String? businessId;
  @JsonKey(name: "tradName")
  String? tradName;

  Business({
    this.businessId,
    this.tradName,
  });

  factory Business.fromJson(Map<String, dynamic> json) => _$BusinessFromJson(json);

  Map<String, dynamic> toJson() => _$BusinessToJson(this);
}


@JsonSerializable()
class BaseData {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "code")
  String? code;
  @JsonKey(name: "name")
  String? name;

  BaseData({
    this.id,
    this.code,
    this.name,
  });

  factory BaseData.fromJson(Map<String, dynamic> json) =>
      _$BaseDataFromJson(json);

  Map<String, dynamic> toJson() => _$BaseDataToJson(this);
}