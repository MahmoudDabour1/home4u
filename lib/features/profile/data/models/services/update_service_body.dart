import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_service_body.g.dart';

@JsonSerializable()
class UpdateServiceBody {
  @JsonKey(name: "id")
  final int id;

  UpdateServiceBody({
    required this.id,
  });

  factory UpdateServiceBody.fromJson(Map<String, dynamic> json) => _$UpdateServiceBodyFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateServiceBodyToJson(this);
}
