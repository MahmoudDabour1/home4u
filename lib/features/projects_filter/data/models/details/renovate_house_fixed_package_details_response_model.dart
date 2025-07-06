import '../renovate_house_filter/renovate_house_fixed_package_filter_response_model.dart';

class RenovateHouseFixedPackageDetailsResponseModel {
  final bool success;
  final int status;
  final CustomPackage data;

  RenovateHouseFixedPackageDetailsResponseModel({
    required this.success,
    required this.status,
    required this.data,
  });

  factory RenovateHouseFixedPackageDetailsResponseModel.fromJson(
      Map<String, dynamic> json) {
    return RenovateHouseFixedPackageDetailsResponseModel(
      success: json['success'] as bool,
      status: json['status'] as int,
      data: CustomPackage.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
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
