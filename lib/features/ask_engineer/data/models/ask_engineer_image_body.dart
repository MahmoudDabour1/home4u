

import 'package:json_annotation/json_annotation.dart';
part 'ask_engineer_image_body.g.dart';
@JsonSerializable()
class AskEngineerImageBody {
  @JsonKey(name: "askEngineerId")
  final int askEngineerId;

  AskEngineerImageBody({required this.askEngineerId});
  factory AskEngineerImageBody.fromJson(Map<String, dynamic> json) =>
      _$AskEngineerImageBodyFromJson(json);
  Map<String, dynamic> toJson() => _$AskEngineerImageBodyToJson(this);


}