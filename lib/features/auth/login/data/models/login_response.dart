import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  bool? success;
  @JsonKey(name: "status")
  int? statusCode;
  @JsonKey(name: "data")
  UserData? userData;

  LoginResponse({this.success, this.statusCode, this.userData});

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}

@JsonSerializable()
class UserData {
  String? token;
  String? refreshToken;
  @JsonKey(name: "user")
  UserInformation? userInformation;

  UserData({this.token, this.refreshToken, this.userInformation});

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}

@JsonSerializable()
class UserInformation {
  int? id;
  int? statusCode;
  @JsonKey(name: 'username')
  String? userName;
  String? email;
  String? phone;
  @JsonKey(name: 'userType')
  UserType? userType;

  UserInformation({
    this.id,
    this.userName,
    this.email,
    this.phone,
    this.userType,
    this.statusCode,
  });

  factory UserInformation.fromJson(Map<String, dynamic> json) =>
      _$UserInformationFromJson(json);

  Map<String, dynamic> toJson() => _$UserInformationToJson(this);
}

@JsonSerializable()
class UserType {
  int? id;
  String? code;
  String? name;

  UserType({
    this.id,
    this.code,
    this.name,
  });

  factory UserType.fromJson(Map<String, dynamic> json) =>
      _$UserTypeFromJson(json);

  Map<String, dynamic> toJson() => _$UserTypeToJson(this);
}
