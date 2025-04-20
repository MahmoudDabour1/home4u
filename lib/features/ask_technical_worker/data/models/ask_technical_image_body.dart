
import 'package:json_annotation/json_annotation.dart';

part 'ask_technical_image_body.g.dart';
@JsonSerializable()
class AskTechnicalImageBody {
  @JsonKey(name: "askWorkerId")
  final int? askWorkerId;

  AskTechnicalImageBody({
    this.askWorkerId,
  });

  factory AskTechnicalImageBody.fromJson(Map<String, dynamic> json) => _$AskTechnicalImageBodyFromJson(json);

  Map<String, dynamic> toJson() => _$AskTechnicalImageBodyToJson(this);
}
