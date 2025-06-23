class InsertProductRateBody {
  final int productId;
  final double rate;
  final String comment;

  InsertProductRateBody({
    required this.productId,
    required this.rate,
    required this.comment,
  });

  Map<String, dynamic> toJson() {
    return {
      "productId": productId,
      "rate": rate,
      "comment": comment,
    };
  }

  factory InsertProductRateBody.fromJson(Map<String, dynamic> json) {
    return InsertProductRateBody(
      productId: json['productId'],
      rate: json['rate'].toDouble(),
      comment: json['comment'],
    );
  }
}