import 'package:transforms/models/user_model.dart';

class RefreshTokenResponseModel {
  String token;

  RefreshTokenResponseModel({
    required this.token
  });

  factory RefreshTokenResponseModel.fromJson(Map<String, dynamic> json) {
    return RefreshTokenResponseModel(token: json["accessToken"]);
  }
}

class AuthResponseModel {
  UserModel user;
  String token;
  String message;
  bool success;

  AuthResponseModel({
    required this.user,
    this.success = false,
    this.token = "",
    this.message = "",
  });

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthResponseModel(
      success: json["success"],
      message: json["message"],
      token: json["accessToken"],
      user: UserModel.fromJson(json["data"][0]),
    );
  }
}

class AuthRequestModel {
  String username;
  String password;

  AuthRequestModel({
    required this.username,
    required this.password
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      "username": username,
      "password": password,
    };
    return data;
  }

}