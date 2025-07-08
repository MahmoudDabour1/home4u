class AddAskTechnicalRequestBody {
  final AskWorker askWorker;
  final String comment;
  final bool? isAccepted;
  final bool? isFinished;
  final bool? isRejected;

  AddAskTechnicalRequestBody({
    required this.askWorker,
    required this.comment,
    required this.isAccepted,
    required this.isFinished,
    required this.isRejected,
  });

  Map<String, dynamic> toJson() {
    return {
      'askWorker': askWorker.toJson(),
      'comment': comment,
      'isAccepted': isAccepted,
      'isFinished': isFinished,
      'isRejected': isRejected,
    };
  }

  factory AddAskTechnicalRequestBody.fromJson(Map<String, dynamic> json) {
    return AddAskTechnicalRequestBody(
      askWorker: AskWorker.fromJson(json['askWorker'] as Map<String, dynamic>),
      comment: json['comment'] as String,
      isAccepted: json['isAccepted'] as bool?,
      isFinished: json['isFinished'] as bool?,
      isRejected: json['isRejected'] as bool?,
    );
  }
}

class AskWorker {
  final int id;

  AskWorker({required this.id});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
    };
  }

  factory AskWorker.fromJson(Map<String, dynamic> json) {
    return AskWorker(
      id: json['id'] as int,
    );
  }
}
