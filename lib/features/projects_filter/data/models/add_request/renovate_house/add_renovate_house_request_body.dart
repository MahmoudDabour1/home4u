class AddRenovateHouseRequestBody {
  final HomeRenovate homeRenovate;
  final String comment;
  final bool? isAccepted;
  final bool? isFinished;
  final bool? isRejected;

  AddRenovateHouseRequestBody({
    required this.homeRenovate,
    required this.comment,
    required this.isAccepted,
    required this.isFinished,
    required this.isRejected,
  });

  factory AddRenovateHouseRequestBody.fromJson(Map<String, dynamic> json) {
    return AddRenovateHouseRequestBody(
      homeRenovate: HomeRenovate.fromJson(json['homeRenovate']),
      comment: json['comment'] as String,
      isAccepted: json['isAccepted'] as bool?,
      isFinished: json['isFinished'] as bool?,
      isRejected: json['isRejected'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'homeRenovate': homeRenovate.toJson(),
      'comment': comment,
      'isAccepted': isAccepted,
      'isFinished': isFinished,
      'isRejected': isRejected,
    };
  }
}

class HomeRenovate {
  final int id;

  HomeRenovate({
    required this.id,
  });

  factory HomeRenovate.fromJson(Map<String, dynamic> json) {
    return HomeRenovate(
      id: json['id'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
    };
  }
}
