import 'dart:convert';
import 'package:transforms/features/authentication/models/auth_model.dart';
import 'package:transforms/features/authentication/models/logout_model.dart';
import 'package:transforms/tools/configuration.dart';
import 'package:transforms/tools/connection.dart';
import 'package:transforms/tools/enum.dart';
import 'package:transforms/tools/exception.dart';

class AuthService {
  final _connection = APIConnection(
    alice: ConfigEnvironments.getEnvironments()['alice']
  );

  String get _authenticatePrefix => 'user/login';
  String get _logoutPrefix => 'user/logout';
  String get _refreshTokenPrefix => 'token';

  Future<AuthResponseModel> authenticate(
    AuthRequestModel model,
  ) async {
    try {
      final response = await _connection.request(
        endpoint: _authenticatePrefix, 
        method: RequestMethod.POST,
        body: model.toJson()
      );
      return AuthResponseModel.fromJson(jsonDecode(response.body));
    } catch (err) {
      throw DefaultException(message: err.toString());
    }
  }

  Future<LogoutResponseModel> logout() async {
    try {
      final response = await _connection.request(
        endpoint: _logoutPrefix, 
        method: RequestMethod.DELETE,
      );
      return LogoutResponseModel.fromJson(jsonDecode(response.body));
    } catch (err) {
      throw DefaultException(message: err.toString());
    }
  }

  Future<RefreshTokenResponseModel> refreshToken() async {
    try {
      final response = await _connection.request(
        endpoint: _refreshTokenPrefix, 
        method: RequestMethod.GET,
      );
      return RefreshTokenResponseModel.fromJson(jsonDecode(response.body));
    } catch (err) {
      throw DefaultException(message: err.toString());
    }
  }
}
