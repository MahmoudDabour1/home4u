class AddRequestDesignRequestBody {
  final RequestDesignItem requestDesignItem;
  final String comment;
  final bool? isAccepted;
  final bool? isFinished;
  final bool? isRejected;

  AddRequestDesignRequestBody({
    required this.requestDesignItem,
    required this.comment,
    this.isAccepted,
    this.isFinished,
    this.isRejected,
  });

  Map<String, dynamic> toJson() {
    return {
      "requestDesign": requestDesignItem.id,
      "comment": comment,
      "isAccepted": isAccepted,
      "isFinished": isFinished,
      "isRejected": isRejected,
    };
  }

  factory AddRequestDesignRequestBody.fromJson(Map<String, dynamic> json) {
    return AddRequestDesignRequestBody(
      requestDesignItem: RequestDesignItem(id: json['requestDesign']),
      comment: json['comment'],
      isAccepted: json['isAccepted'] as bool?,
      isFinished: json['isFinished'] as bool?,
      isRejected: json['isRejected'] as bool?,
    );
  }
}

class RequestDesignItem {
  final int id;

  RequestDesignItem({
    required this.id,
  });
}
