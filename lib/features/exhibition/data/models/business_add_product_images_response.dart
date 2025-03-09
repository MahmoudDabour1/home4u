import 'business_add_product_body.dart';

class BusinessAddProductImagesResponse {
  final bool success;
  final int status;
  final List<BusinessAddProductBody> data;

  BusinessAddProductImagesResponse({
    required this.success,
    required this.status,
    required this.data,
  });

  factory BusinessAddProductImagesResponse.fromJson(Map<String, dynamic> json) {
    return BusinessAddProductImagesResponse(
      success: json["success"],
      status: json["status"],
      data: List<BusinessAddProductBody>.from(
          json["data"].map((x) => BusinessAddProductBody.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "success": success,
      "status": status,
      "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
  }
}
