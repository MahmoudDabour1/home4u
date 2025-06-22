import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'engineer_profile_response_model.g.dart';

@HiveType(typeId: 70)
@JsonSerializable()
class EngineerProfileResponseModel {
  @HiveField(0)
  @JsonKey(name: "success")
  bool? success;

  @HiveField(1)
  @JsonKey(name: "status")
  int? status;

  @HiveField(2)
  @JsonKey(name: "data")
  FreeLancerData? data;

  EngineerProfileResponseModel({
    this.success,
    this.status,
    this.data,
  });

  factory EngineerProfileResponseModel.fromJson(Map<String, dynamic> json) =>
      _$EngineerProfileResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$EngineerProfileResponseModelToJson(this);
}

@HiveType(typeId: 71)
@JsonSerializable()
class FreeLancerData {
  @HiveField(0)
  @JsonKey(name: "id")
  int? id;

  @HiveField(1)
  @JsonKey(name: "statusCode")
  dynamic statusCode;

  @HiveField(2)
  @JsonKey(name: "user")
  FreeLancerUser? user;

  @HiveField(3)
  @JsonKey(name: "type")
  FreeLancerType? type;

  @HiveField(4)
  @JsonKey(name: "yearsOfExperience")
  int? yearsOfExperience;

  @HiveField(5)
  @JsonKey(name: "engineerServ")
  List<FreeLancerType>? engineerServ;

  @HiveField(6)
  @JsonKey(name: "bio")
  String? bio;

  @HiveField(7)
  @JsonKey(name: "linkedinLink")
  String? linkedin;

  @HiveField(8)
  @JsonKey(name: "behanceLink")
  String? behance;
  @HiveField(9)
  @JsonKey(name: "facebookLink")
  String? facebookLink;
  @HiveField(10)
  @JsonKey(name: "averageRate")
  double? averageRate;

  FreeLancerData({
    this.id,
    this.statusCode,
    this.user,
    this.type,
    this.yearsOfExperience,
    this.engineerServ,
    this.bio,
    this.linkedin,
    this.behance,
    this.facebookLink,
    this.averageRate,
  });

  factory FreeLancerData.fromJson(Map<String, dynamic> json) =>
      _$FreeLancerDataFromJson(json);

  Map<String, dynamic> toJson() => _$FreeLancerDataToJson(this);
}

@HiveType(typeId: 72)
@JsonSerializable()
class FreeLancerType {
  @HiveField(0)
  @JsonKey(name: "id")
  int? id;

  @HiveField(1)
  @JsonKey(name: "code")
  String? code;

  @HiveField(2)
  @JsonKey(name: "name")
  String? name;

  // @HiveField(3)
  // @JsonKey(name: "nameAr")
  // String? nameAr;
  //
  // @HiveField(4)
  // @JsonKey(name: "nameEn")
  // String? nameEn;

  // @HiveField(5)
  // @JsonKey(name: "engineerType")
  // FreeLancerType? engineerType;

  FreeLancerType({
    this.id,
    this.code,
    this.name,
    // this.nameAr,
    // this.nameEn,
    // this.engineerType,
  });

  factory FreeLancerType.fromJson(Map<String, dynamic> json) =>
      _$FreeLancerTypeFromJson(json);

  Map<String, dynamic> toJson() => _$FreeLancerTypeToJson(this);
}

@HiveType(typeId: 73)
@JsonSerializable()
class FreeLancerUser {
  @HiveField(0)
  @JsonKey(name: "id")
  int? id;

  @HiveField(1)
  @JsonKey(name: "firstName")
  String? firstName;

  @HiveField(2)
  @JsonKey(name: "lastName")
  String? lastName;

  @HiveField(3)
  @JsonKey(name: "email")
  String? email;

  @HiveField(4)
  @JsonKey(name: "phone")
  String? phone;

  @HiveField(5)
  @JsonKey(name: "personalPhoto")
  dynamic personalPhoto;

  @HiveField(6)
  @JsonKey(name: "password")
  String? password;

  @HiveField(7)
  @JsonKey(name: "userType")
  FreeLancerCity? userType;

  @HiveField(8)
  @JsonKey(name: "governorate")
  FreeLancerCity? governorate;

  @HiveField(9)
  @JsonKey(name: "city")
  FreeLancerCity? city;

  @HiveField(10)
  @JsonKey(name: "engineer")
  dynamic engineer;

  @HiveField(11)
  @JsonKey(name: "technicalWorker")
  dynamic technicalWorker;

  @HiveField(12)
  @JsonKey(name: "enabled")
  bool? enabled;

  FreeLancerUser({
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

  factory FreeLancerUser.fromJson(Map<String, dynamic> json) =>
      _$FreeLancerUserFromJson(json);

  Map<String, dynamic> toJson() => _$FreeLancerUserToJson(this);
}

@HiveType(typeId: 74)
@JsonSerializable()
class FreeLancerCity {
  @HiveField(0)
  @JsonKey(name: "id")
  int? id;

  @HiveField(1)
  @JsonKey(name: "code")
  String? code;

  @HiveField(2)
  @JsonKey(name: "name")
  dynamic name;

  FreeLancerCity({
    this.id,
    this.code,
    this.name,
  });

  factory FreeLancerCity.fromJson(Map<String, dynamic> json) =>
      _$FreeLancerCityFromJson(json);

  Map<String, dynamic> toJson() => _$FreeLancerCityToJson(this);
}
