import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'engineering_office_profile_response_model.g.dart';

@HiveType(typeId: 90)
@JsonSerializable()
class EngineeringOfficeProfileResponseModel {
  @HiveField(0)
  @JsonKey(name: "success")
  final bool? success;

  @HiveField(1)
  @JsonKey(name: "status")
  final int? status;

  @HiveField(2)
  @JsonKey(name: "data")
  final EngineeringOfficeData? data;

  EngineeringOfficeProfileResponseModel({
    this.success,
    this.status,
    this.data,
  });

  factory EngineeringOfficeProfileResponseModel.fromJson(
          Map<String, dynamic> json) =>
      _$EngineeringOfficeProfileResponseModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$EngineeringOfficeProfileResponseModelToJson(this);
}

@HiveType(typeId: 91)
@JsonSerializable()
class EngineeringOfficeData {
  @HiveField(0)
  @JsonKey(name: "id")
  final int? id;

  @HiveField(1)
  @JsonKey(name: "statusCode")
  final int? statusCode;

  @HiveField(2)
  @JsonKey(name: "user")
  final EngineeringOfficeUser? user;

  @HiveField(3)
  @JsonKey(name: "tradeName")
  final String? name;

  @HiveField(4)
  @JsonKey(name: "description")
  final String? description;

  @HiveField(5)
  @JsonKey(name: "commercialRegisterPath")
  final String? commercialRegisterPath;

  @HiveField(6)
  @JsonKey(name: "taxCardPath")
  final dynamic taxCardPath;

  @HiveField(7)
  @JsonKey(name: "personalCardPath")
  final dynamic personalCardPath;

  @HiveField(8)
  @JsonKey(name: "engineeringOfficeField")
  final EngineeringOffice? engineeringOfficeField;

  @HiveField(9)
  @JsonKey(name: "engineeringOfficeDepartments")
  List<EngineeringOffice>? engineeringOfficeDepartments;

  @HiveField(10)
  @JsonKey(name: "linkedinLink")
  String? linkedin;

  @HiveField(11)
  @JsonKey(name: "behanceLink")
  String? behance;
  @HiveField(12)
  @JsonKey(name: "facebookLink")
  String? facebookLink;
  @HiveField(13)
  @JsonKey(name: "averageRate")
  double? averageRate;

  EngineeringOfficeData({
    this.id,
    this.statusCode,
    this.user,
    this.name,
    this.description,
    this.commercialRegisterPath,
    this.taxCardPath,
    this.personalCardPath,
    this.engineeringOfficeField,
    this.engineeringOfficeDepartments,
    this.linkedin,
    this.behance,
    this.facebookLink,
    this.averageRate,
  });

  factory EngineeringOfficeData.fromJson(Map<String, dynamic> json) =>
      _$EngineeringOfficeDataFromJson(json);

  Map<String, dynamic> toJson() => _$EngineeringOfficeDataToJson(this);
}

@HiveType(typeId: 92)
@JsonSerializable()
class EngineeringOffice {
  @HiveField(0)
  @JsonKey(name: "id")
  final int? id;

  @HiveField(1)
  @JsonKey(name: "code")
  final String? code;

  @HiveField(2)
  @JsonKey(name: "name")
  final String? name;

  @HiveField(3)
  @JsonKey(name: "nameAr")
  final String? nameAr;

  @HiveField(4)
  @JsonKey(name: "nameEn")
  final String? nameEn;

  EngineeringOffice({
    this.id,
    this.code,
    this.name,
    this.nameAr,
    this.nameEn,
  });

  factory EngineeringOffice.fromJson(Map<String, dynamic> json) =>
      _$EngineeringOfficeFromJson(json);

  Map<String, dynamic> toJson() => _$EngineeringOfficeToJson(this);
}

@HiveType(typeId: 93)
@JsonSerializable()
class EngineeringOfficeUser {
  @HiveField(0)
  @JsonKey(name: "id")
  final int? id;

  @HiveField(1)
  @JsonKey(name: "firstName")
  final String? firstName;

  @HiveField(2)
  @JsonKey(name: "lastName")
  final String? lastName;

  @HiveField(3)
  @JsonKey(name: "email")
  final String? email;

  @HiveField(4)
  @JsonKey(name: "phone")
  final String? phone;

  @HiveField(5)
  @JsonKey(name: "personalPhoto")
  final dynamic personalPhoto;

  @HiveField(6)
  @JsonKey(name: "userType")
  final EngineeringOfficeCity? userType;

  @HiveField(7)
  @JsonKey(name: "governorate")
  final EngineeringOfficeCity? governorate;

  @HiveField(8)
  @JsonKey(name: "city")
  final EngineeringOfficeCity? city;

  @HiveField(9)
  @JsonKey(name: "engineer")
  final dynamic engineer;

  @HiveField(10)
  @JsonKey(name: "technicalWorker")
  final dynamic technicalWorker;

  @HiveField(11)
  @JsonKey(name: "engineeringOffice")
  final dynamic engineeringOffice;

  @HiveField(12)
  @JsonKey(name: "enabled")
  final bool? enabled;

  @HiveField(13)
  @JsonKey(name: "business")
  final dynamic business;
  @HiveField(14)
  @JsonKey(name: "coverPhoto")
  final dynamic coverPhoto;

  EngineeringOfficeUser({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.personalPhoto,
    this.userType,
    this.governorate,
    this.city,
    this.engineer,
    this.technicalWorker,
    this.engineeringOffice,
    this.enabled,
    this.business,
    this.coverPhoto,
  });

  factory EngineeringOfficeUser.fromJson(Map<String, dynamic> json) =>
      _$EngineeringOfficeUserFromJson(json);

  Map<String, dynamic> toJson() => _$EngineeringOfficeUserToJson(this);
}

@HiveType(typeId: 94)
@JsonSerializable()
class EngineeringOfficeCity {
  @HiveField(0)
  @JsonKey(name: "id")
  final int? id;

  @HiveField(1)
  @JsonKey(name: "code")
  final String? code;

  @HiveField(2)
  @JsonKey(name: "name")
  final String? name;

  EngineeringOfficeCity({
    this.id,
    this.code,
    this.name,
  });

  factory EngineeringOfficeCity.fromJson(Map<String, dynamic> json) =>
      _$EngineeringOfficeCityFromJson(json);

  Map<String, dynamic> toJson() => _$EngineeringOfficeCityToJson(this);
}
