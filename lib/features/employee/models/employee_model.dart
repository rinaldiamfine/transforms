import 'package:transforms/models/user_model.dart';

class DefaultEmployeeResponseModel {
  String message;
  bool success;

  DefaultEmployeeResponseModel({
    this.success = false,
    this.message = "",
  });

  factory DefaultEmployeeResponseModel.fromJson(Map<String, dynamic> json) {
    return DefaultEmployeeResponseModel(
      success: json["success"],
      message: json["message"],
    );
  }
}

class EmployeeResponseModel {
  List<UserModel> employee;
  String message;
  bool success;

  EmployeeResponseModel({
    required this.employee,
    this.success = false,
    this.message = "",
  });

  factory EmployeeResponseModel.fromJson(Map<String, dynamic> json) {
    return EmployeeResponseModel(
      success: json["success"],
      message: json["message"],
      employee: json["data"] == null ? [] : List<UserModel>.from(json["data"]!.map((x) {
        return UserModel.fromJson(x);
      }))
    );
  }
}
