
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:transforms/features/authentication/models/auth_model.dart';
import 'package:transforms/features/authentication/models/logout_model.dart';
import 'package:transforms/features/authentication/services/auth_service.dart';
import 'package:transforms/models/user_model.dart';
import 'package:transforms/tools/constant.dart';

class AuthRepository {
  final AuthService _authService;
  final _storage = Get.find<GetStorage>();

  AuthRepository({
    required AuthService authService,
  }) : _authService = authService;

  void writeUserProfileToStorage(UserModel profile) {
    final profileJson = profile.toJson();
    _storage.write(StorageConstants.user, profileJson);
  }

  UserModel getUserProfileFromStorage() {
    final profileJson =
        _storage.read(StorageConstants.user) as Map<String, dynamic>?;
    UserModel profile = UserModel.fromJson(profileJson!);
    return profile;
  }

  Future<AuthResponseModel> authenticate(
      AuthRequestModel model) async {
    try {
      final response = await _authService.authenticate(model);
      _storage.write(
        StorageConstants.tokenAuthorization,
        response.token
      );
      writeUserProfileToStorage(response.user);
      return response;
    } catch (err) {
      rethrow;
    }
  }

  Future<LogoutResponseModel> logout() async {
    try {
      final response = await _authService.logout();
      return response;
    } catch (err) {
      rethrow;
    }
  }

  bool isAuthenticated() {
    try {
      final hasToken = _storage.hasData(StorageConstants.tokenAuthorization);
      final hasUser = _storage.hasData(StorageConstants.user);
      return hasToken && hasUser;
    } catch (err) {
      rethrow;
    }
  }

  Future<RefreshTokenResponseModel> refreshToken() async {
    try {
      final response = await _authService.refreshToken();
      return response;
    } catch (err) {
      rethrow;
    }
  }
}
