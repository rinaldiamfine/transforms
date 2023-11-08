import 'package:transforms/features/authentication/repositories/auth_repository.dart';
import 'package:transforms/features/authentication/services/auth_service.dart';

class AppRoutes {
  static const String login = '/login';
  static const String home = '/';
  static const String profile = '/profile';
  static const String profileSetting = '/profile/setting';

  static const String task = '/task';
  static const String taskPicker = '/task/picker';
  static const String taskReason = '/task/reason';

  static const String machineDetail = '/machine';

  static const String employee = '/employee';


  static Future<String> get initialRoute async {
    try {
      final authService = AuthService();
      final authDomainService = AuthRepository(authService: authService);
      final authenticated = authDomainService.isAuthenticated();
      return authenticated ? home : login;
    } catch (err) {
      return login;
    }
  }
}