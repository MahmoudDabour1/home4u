class ProjectData {
  final String name;
  final String description;
  final String startDate;
  final String endDate;
  final String tools;

  ProjectData({
    required this.name,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.tools,
  });

  factory ProjectData.fromJson(Map<String, dynamic> json) {
    return ProjectData(
      name: json['name'],
      description: json['description'],
      startDate: json['startDate'],
      endDate: json['endDate'],
      tools: json['tools'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "description": description,
      "startDate": startDate,
      "endDate": endDate,
      "tools": tools,
    };
  }
}
