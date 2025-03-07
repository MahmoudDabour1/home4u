class ProductMaterialModel {
  final int id;
  final String code;
  final String nameAr;
  final String nameEn;
  final int statusCode;

  ProductMaterialModel({
    required this.code,
    required this.nameAr,
    required this.nameEn,
    required this.statusCode,
    required this.id,
  });

  factory ProductMaterialModel.fromJson(Map<String, dynamic> json) {
    return ProductMaterialModel(
      id: int.parse(json["id"]),
      code: json["code"],
      nameAr: json["nameAr"],
      nameEn: json["nameEn"],
      statusCode: int.parse(json["statusCode"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "code": code,
      "nameAr": nameAr,
      "nameEn": nameEn,
      "statusCode": statusCode,
    };
  }

  bool isEqual(ProductMaterialModel other) {
    return id == other.id;
  }
}

