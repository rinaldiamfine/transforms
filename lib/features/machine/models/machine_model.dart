import 'package:transforms/models/machine_model.dart';

class MachineResponseModel {
  List<MachineModel> machines;
  String message;
  bool success;

  MachineResponseModel({
    required this.message,
    required this.success,
    required this.machines
  });

  factory MachineResponseModel.fromJson(Map<String, dynamic> json) {
    return MachineResponseModel(
      message: json["message"], 
      success: json["success"], 
      machines: List<MachineModel>.from(json["data"]!.map((x) {
        return MachineModel.fromJson(x);
      }))
    );
  }

}