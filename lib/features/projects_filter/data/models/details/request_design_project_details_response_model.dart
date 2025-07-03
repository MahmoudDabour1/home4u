import '../request_design_filter/request_design_filter_response_model.dart';

class RequestDesignProjectDetailsResponseModel {
  final bool success;
  final int status;
  final RequestDesignFilterContent data;

  RequestDesignProjectDetailsResponseModel({
    required this.success,
    required this.status,
    required this.data,
  });

  factory RequestDesignProjectDetailsResponseModel.fromJson(Map<String, dynamic> json) {
    return RequestDesignProjectDetailsResponseModel(
      success: json['success'] as bool,
      status: json['status'] as int,
      data: RequestDesignFilterContent.fromJson(json['data'] as Map<String, dynamic>),
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