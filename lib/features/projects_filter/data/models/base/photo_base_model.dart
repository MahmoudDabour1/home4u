import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo_base_model.g.dart';

@JsonSerializable()
class PhotoBaseModel {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "askWorkerId")
  final int? askWorkerId;
  @JsonKey(name: "photoPath")
  final String? photoPath;

  PhotoBaseModel({
    this.id,
    this.askWorkerId,
    this.photoPath,
  });

  factory PhotoBaseModel.fromJson(Map<String, dynamic> json) =>
      _$PhotoBaseModelFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoBaseModelToJson(this);
}
