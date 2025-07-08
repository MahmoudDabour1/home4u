class AddRenovateHouseCustomPackageRequestBody {
  final SelectCustomPackage selectCustomPackage;
  final String comment;
  final bool? isAccepted;
  final bool? isFinished;
  final bool? isRejected;

  AddRenovateHouseCustomPackageRequestBody({
    required this.selectCustomPackage,
    required this.comment,
    required this.isAccepted,
    required this.isFinished,
    required this.isRejected,
  });

  factory AddRenovateHouseCustomPackageRequestBody.fromJson(
      Map<String, dynamic> json) {
    return AddRenovateHouseCustomPackageRequestBody(
      selectCustomPackage: SelectCustomPackage.fromJson(
          json['selectCustomPackage'] as Map<String, dynamic>),
      comment: json['comment'] as String,
      isAccepted: json['isAccepted'] as bool?,
      isFinished: json['isFinished'] as bool?,
      isRejected: json['isRejected'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'selectCustomPackage': selectCustomPackage.toJson(),
      'comment': comment,
      'isAccepted': isAccepted,
      'isFinished': isFinished,
      'isRejected': isRejected,
    };
  }
}

class SelectCustomPackage {
  final int id;

  SelectCustomPackage({required this.id});

  factory SelectCustomPackage.fromJson(Map<String, dynamic> json) {
    return SelectCustomPackage(
      id: json['id'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
    };
  }
}
