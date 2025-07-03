import '../ask_filter/technical/ask_technical_worker_filter_response_model.dart';

class AskTechnicalProjectDetailsResponseModel {
  final bool success;
  final int status;
  final AskTechnicalContent data;

  AskTechnicalProjectDetailsResponseModel({
    required this.success,
    required this.status,
    required this.data,
  });

  factory AskTechnicalProjectDetailsResponseModel.fromJson(Map<String, dynamic> json) {
    return AskTechnicalProjectDetailsResponseModel(
      success: json['success'] as bool,
      status: json['status'] as int,
      data: AskTechnicalContent.fromJson(json['data'] as Map<String, dynamic>),
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