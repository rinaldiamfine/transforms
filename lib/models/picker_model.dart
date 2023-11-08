class PickerModel {
  String id;
  String name;
  String? subtitle;

  PickerModel({
    required this.id,
    required this.name,
    this.subtitle
  });

  factory PickerModel.fromJson(Map<String, dynamic> json) {
    return PickerModel(
      id: json["id"] ?? "",
      name: json["name"] ?? "",
      subtitle: json['subtitle'] ?? ""
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "subtitle": subtitle
    };
  }}