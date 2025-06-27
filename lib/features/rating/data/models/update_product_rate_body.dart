class UpdateProductRateBody {
  final int id;
  final int statusCode;
  final int productId;
  final double rate;
  final String comment;

  UpdateProductRateBody({
    required this.id,
    required this.statusCode,
    required this.productId,
    required this.rate,
    required this.comment,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'statusCode': statusCode,
      'productId': productId,
      'rate': rate,
      'comment': comment,
    };
  }

  factory UpdateProductRateBody.fromJson(Map<String, dynamic> json) {
    return UpdateProductRateBody(
      id: json['id'] as int,
      statusCode: json['statusCode'] as int,
      productId: json['productId'] as int,
      rate: (json['rate'] as num).toDouble(),
      comment: json['comment'] as String,
    );
  }
}
