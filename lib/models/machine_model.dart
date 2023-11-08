import 'package:transforms/tools/enum.dart';
import 'package:transforms/tools/helper.dart';

class MachineModel {
  String id;
  DateTime dateUpdated;
  MachineStatus? status;
  MachineTypeModel type;

  MachineModel({
    required this.id,
    required this.dateUpdated,
    required this.type,
    required this.status,
  });

  factory MachineModel.fromJson(Map<String, dynamic> json) {
    return MachineModel(
      id: json["machine_id"], 
      dateUpdated: dateFormatWithTimeZone().parse(json["updatedAt"] ?? dateFormatWithTimeZone().format(DateTime.now()).toString()),
      type: MachineTypeModel.fromJson(json["machine_profile"]), 
      status: json["status"] != null ? MachineStatus.values.asNameMap()[json["status"]] : null
    );
  }
}

class MachineTypeModel {
  String serial;
  String name;
  String type;
  String description;
  String image;

  MachineTypeModel({
    required this.serial,
    required this.name,
    required this.type,
    required this.description,
    required this.image,
  });

  factory MachineTypeModel.fromJson(Map<String, dynamic> json) {
    return MachineTypeModel(
      serial: json["serial_machine"],
      name: json["machine_name"],
      type: json["machine_game_type"],
      description: json["machine_description"],
      image: json["machine_image"] ?? "",
    );
  }
}

class MachineDetailModel extends MachineModel {
  String? description;

  MachineDetailModel({
    required super.id,
    required super.dateUpdated, 
    required super.status,
    required super.type,
    this.description, 
  });
}