import '../renovate_house_filter/renovate_house_filter_response_model.dart';

class RenovateHouseDetailsResponseModel {
  final bool success;
  final int status;
  final RenovateHouseContent data;

  RenovateHouseDetailsResponseModel({
    required this.success,
    required this.status,
    required this.data,
  });

  factory RenovateHouseDetailsResponseModel.fromJson(
      Map<String, dynamic> json) {
    return RenovateHouseDetailsResponseModel(
      success: json['success'] as bool,
      status: json['status'] as int,
      data: RenovateHouseContent.fromJson(json['data'] as Map<String, dynamic>),
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
