class RatingReviewRequestModel {
  final int pageNumber;
  final int pageSize;
  final SearchCriteria searchCriteria;

  RatingReviewRequestModel({
    required this.pageNumber,
    required this.pageSize,
    required this.searchCriteria,
  });

  Map<String, dynamic> toJson() {
    return {
      'pageNumber': pageNumber,
      'pageSize': pageSize,
      'searchCriteria': searchCriteria.toJson(),
    };
  }
}

class SearchCriteria {
  final int productId;
  final int? stars;
  final bool isTopRated;

  SearchCriteria({
    required this.productId,
    this.stars,
    required this.isTopRated,
  });

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'stars': stars,
      'isTopRated': isTopRated,
    };
  }
}
