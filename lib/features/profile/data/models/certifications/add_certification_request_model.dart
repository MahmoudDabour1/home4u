import 'dart:io';

class AddCertificationRequestModel {
  final Certificate certificate;
  final File? image;

  AddCertificationRequestModel(
      {required this.certificate, required this.image});

  factory AddCertificationRequestModel.fromJson(Map<String, dynamic> json) {
    return AddCertificationRequestModel(
        certificate: Certificate.fromJson(json['certificate']),
        image: json['image']);
  }

  Map<String, dynamic> toJson() {
    return {'certificate': certificate.toJson(), 'image': image};
  }
}

class Certificate {
  final String name;
  final String description;

  Certificate({required this.name, required this.description});

  factory Certificate.fromJson(Map<String, dynamic> json) {
    return Certificate(name: json['name'], description: json['description']);
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'description': description};
  }
}
