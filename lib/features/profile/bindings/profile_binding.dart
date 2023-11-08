import 'package:get/get.dart';
import 'package:transforms/controllers.dart';
import 'package:transforms/features/authentication/repositories/auth_repository.dart';
import 'package:transforms/features/authentication/services/auth_service.dart';

class ProfileBinding implements Bindings {
  @override
  void dependencies() {

    final authService = AuthService();
    final authRepository = AuthRepository(authService: authService);
    Get.lazyPut(() => ProfileController(
      authRepository: authRepository
    ));
  }

}