class DressingRequestModel {
  final IdModel requestType;
  final String phoneNumber;
  final IdModel government;
  final int timeFrameDays;
  final double budget;
  final List<IdModel> productMaterial;
  final String? note;

  DressingRequestModel({
    required this.requestType,
    required this.phoneNumber,
    required this.government,
    required this.timeFrameDays,
    required this.budget,
    required this.productMaterial,
    this.note,
  });

  Map<String, dynamic> toJson() {
    return {
      'requestType': requestType.toJson(),
      'phoneNumber': phoneNumber,
      'government': government.toJson(),
      'timeFrameDays': timeFrameDays,
      'budget': budget,
      'productMaterial': productMaterial.map((e) => e.toJson()).toList(),
      if (note != null) 'note': note,
    };
  }
}

class IdModel {
  final int id;

  IdModel({required this.id});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
    };
  }
}
