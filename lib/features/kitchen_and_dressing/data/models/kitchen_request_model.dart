class KitchenRequestModel {
  final KitchenIdModel requestType;
  final String phoneNumber;
  final KitchenIdModel government;
  final int timeFrameDays;
  final double budget;
  final int kitchenSize;
  final List<KitchenIdModel> devicesAttacheds;
  final List<KitchenIdModel> productMaterial;
  final KitchenIdModel kitchenType;
  final String? note;

  KitchenRequestModel({
    required this.requestType,
    required this.phoneNumber,
    required this.government,
    required this.timeFrameDays,
    required this.budget,
    required this.kitchenSize,
    required this.devicesAttacheds,
    required this.productMaterial,
    required this.kitchenType,
    this.note,
  });

  Map<String, dynamic> toJson() {
    return {
      'requestType': requestType.toJson(),
      'phoneNumber': phoneNumber,
      'government': government.toJson(),
      'timeFrameDays': timeFrameDays,
      'budget': budget,
      'kitchenSize': kitchenSize,
      'devicesAttacheds': devicesAttacheds.map((e) => e.toJson()).toList(),
      'productMaterial': productMaterial.map((e) => e.toJson()).toList(),
      'kitchenType': kitchenType.toJson(),
      if (note != null) 'note': note,
    };
  }
}
class KitchenIdModel {
  final int id;

  KitchenIdModel({required this.id});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
    };
  }
}
