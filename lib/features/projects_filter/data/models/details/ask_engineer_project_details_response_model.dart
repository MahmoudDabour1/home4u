import '../ask_filter/engineer/ask_engineer_filter_response_model.dart';

class AskEngineerProjectDetailsResponseModel {
  final bool success;
  final int status;
  final AskEngineerContent data;

  AskEngineerProjectDetailsResponseModel({
    required this.success,
    required this.status,
    required this.data,
  });

  factory AskEngineerProjectDetailsResponseModel.fromJson(
      Map<String, dynamic> json) {
    return AskEngineerProjectDetailsResponseModel(
      success: json['success'] as bool,
      status: json['status'] as int,
      data: AskEngineerContent.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'status': status,
      'data': data.toJson(),
    };
  }
}
