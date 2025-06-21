
class FurnishYourHomeRequestModel {
  final IdModel requestType;
  final String phoneNumber;
  final IdModel government;
  final int timeFrameDays;
  final double budget;
  final IdModel furnitureType;
  final String? note;

  FurnishYourHomeRequestModel({
    required this.requestType,
    required this.phoneNumber,
    required this.government,
    required this.timeFrameDays,
    required this.budget,
    required this.furnitureType,
    this.note,
  });

  Map<String, dynamic> toJson() {
    return {
      'requestType': requestType.toJson(),
      'phoneNumber': phoneNumber,
      'government': government.toJson(),
      'timeFrameDays': timeFrameDays,
      'budget': budget,
      'furnitureType': furnitureType.toJson(),
      if (note != null) 'note': note,
    };
  }
}

class IdModel {
  final int id;

  IdModel({required this.id});

  Map<String, dynamic> toJson() {
    return {'id': id};
  }
}
