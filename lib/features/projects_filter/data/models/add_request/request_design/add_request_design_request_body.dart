class AddRequestDesignRequestBody {
  final SelectCustomPackage selectCustomPackage;
  final String comment;
  final bool? isAccepted;
  final bool? isFinished;
  final bool? isRejected;

  AddRequestDesignRequestBody({
    required this.selectCustomPackage,
    required this.comment,
    required this.isAccepted,
    required this.isFinished,
    required this.isRejected,
  });

  Map<String, dynamic> toJson() {
    return {
      "selectCustomPackage": selectCustomPackage.id,
      "comment": comment,
      "isAccepted": isAccepted,
      "isFinished": isFinished,
      "isRejected": isRejected,
    };
  }

  factory AddRequestDesignRequestBody.fromJson(Map<String, dynamic> json) {
    return AddRequestDesignRequestBody(
      selectCustomPackage: SelectCustomPackage(id: json['selectCustomPackage']),
      comment: json['comment'],
      isAccepted: json['isAccepted'] as bool?,
      isFinished: json['isFinished'] as bool?,
      isRejected: json['isRejected'] as bool?,
    );
  }
}

class SelectCustomPackage {
  final int id;

  SelectCustomPackage({
    required this.id,
  });
}
