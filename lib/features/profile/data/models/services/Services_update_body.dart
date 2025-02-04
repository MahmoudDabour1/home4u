
class ServicesUpdateBody {
  int? id;

  ServicesUpdateBody({
    this.id,
  });

  ServicesUpdateBody.fromJson(dynamic json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    return map;
  }
}
