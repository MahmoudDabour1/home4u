// To parse this JSON data, do
//
//     final enginner = enginnerFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';

part 'profile_response_model.g.dart';
@JsonSerializable()
class ProfileResponseModel {
  @JsonKey(name: "success")
  bool? success;
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "data")
  Data? data;

  ProfileResponseModel({
    this.success,
    this.status,
    this.data,
  });

  factory ProfileResponseModel.fromJson(Map<String, dynamic> json) => _$ProfileResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileResponseModelToJson(this);

}

@JsonSerializable()
class Data {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "statusCode")
  dynamic statusCode;
  @JsonKey(name: "user")
  User? user;
  @JsonKey(name: "type")
  Type? type;
  @JsonKey(name: "yearsOfExperience")
  int? yearsOfExperience;
  @JsonKey(name: "engineerServ")
  List<Type>? engineerServ;
  @JsonKey(name: "bio")
  String? bio;
  @JsonKey(name: "linkedin")
  String? linkedin;
  @JsonKey(name: "behance")
  String? behance;

  Data({
    this.id,
    this.statusCode,
    this.user,
    this.type,
    this.yearsOfExperience,
    this.engineerServ,
    this.bio,
    this.linkedin,
    this.behance,
  });

factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Type {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "code")
  String? code;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "nameAr")
  String? nameAr;
  @JsonKey(name: "nameEn")
  String? nameEn;
  @JsonKey(name: "engineerType")
  Type? engineerType;

  Type({
    this.id,
    this.code,
    this.name,
    this.nameAr,
    this.nameEn,
    this.engineerType,
  });

  factory Type.fromJson(Map<String, dynamic> json) => _$TypeFromJson(json);

  Map<String, dynamic> toJson() => _$TypeToJson(this);
}

@JsonSerializable()
class User {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "firstName")
  String? firstName;
  @JsonKey(name: "lastName")
  String? lastName;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "phone")
  String? phone;
  @JsonKey(name: "personalPhoto")
  dynamic personalPhoto;
  @JsonKey(name: "password")
  String? password;
  @JsonKey(name: "userType")
  City? userType;
  @JsonKey(name: "governorate")
  City? governorate;
  @JsonKey(name: "city")
  City? city;
  @JsonKey(name: "engineer")
  dynamic engineer;
  @JsonKey(name: "technicalWorker")
  dynamic technicalWorker;
  @JsonKey(name: "enabled")
  bool? enabled;

  User({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.personalPhoto,
    this.password,
    this.userType,
    this.governorate,
    this.city,
    this.engineer,
    this.technicalWorker,
    this.enabled,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class City {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "code")
  String? code;
  @JsonKey(name: "name")
  dynamic name;

  City({
    this.id,
    this.code,
    this.name,
  });

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);

  Map<String, dynamic> toJson() => _$CityToJson(this);
}
