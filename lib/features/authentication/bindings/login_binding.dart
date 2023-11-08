import 'package:get/get.dart';
import 'package:transforms/features/authentication/controllers/login_controller.dart';
import 'package:transforms/features/authentication/repositories/auth_repository.dart';
import 'package:transforms/features/authentication/services/auth_service.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    final authService = AuthService();
    final authRepository = AuthRepository(authService: authService);
    Get.lazyPut(() => LoginController(authRepository: authRepository));
  }
}