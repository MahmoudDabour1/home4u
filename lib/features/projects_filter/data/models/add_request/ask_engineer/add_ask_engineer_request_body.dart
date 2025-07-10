class AddAskEngineerRequestBody {
  final AskEngineer askEngineer;
  final String comment;
  final bool? isAccepted;
  final bool? isFinished;
  final bool? isRejected;

  AddAskEngineerRequestBody({
    required this.askEngineer,
    required this.comment,
    this.isAccepted,
    this.isFinished,
    this.isRejected,
  });

  factory AddAskEngineerRequestBody.fromJson(Map<String, dynamic> json) {
    return AddAskEngineerRequestBody(
      askEngineer:
          AskEngineer.fromJson(json['askEngineer'] as Map<String, dynamic>),
      comment: json['comment'] as String,
      isAccepted: json['isAccepted'] as bool?,
      isFinished: json['isFinished'] as bool?,
      isRejected: json['isRejected'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'askEngineer': askEngineer.toJson(),
      'comment': comment,
      'isAccepted': isAccepted,
      'isFinished': isFinished,
      'isRejected': isRejected,
    };
  }
}

class AskEngineer {
  final int id;

  AskEngineer({
    required this.id,
  });

  factory AskEngineer.fromJson(Map<String, dynamic> json) {
    return AskEngineer(
      id: json['id'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
    };
  }
}
