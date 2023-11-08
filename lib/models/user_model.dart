import 'package:transforms/tools/enum.dart';

class UserModel {
  String id;
  String name;
  String phone;
  String? photo;
  UserRole role;
  String? refreshToken;

  UserModel({
    required this.id,
    required this.name,
    this.phone = "",
    this.photo,
    this.refreshToken = "",
    this.role = UserRole.Technician,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["user_id"],
      name : json["user_name"] ?? "",
      phone : json["user_phone_number"] ?? "",
      photo : json["user_photo"] ?? "",
      refreshToken: json["refresh_token"] ?? "",
      role: UserRole.Admin.name == json["role"] ? UserRole.Admin : UserRole.Technician
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      "id": id,
      "user_name": name,
      "user_phone_number": phone,
      "user_photo": photo,
      "role": role.name,
      "refresh_token": refreshToken
    };
    return data;
  } 

}