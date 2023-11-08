import 'package:get/get.dart';
import 'package:transforms/controllers.dart';
import 'package:transforms/features/authentication/repositories/auth_repository.dart';
import 'package:transforms/features/authentication/services/auth_service.dart';
import 'package:transforms/features/employee/repositories/employee_repository.dart';
import 'package:transforms/features/employee/services/employee_service.dart';
import 'package:transforms/features/machine/repositories/machine_repository.dart';
import 'package:transforms/features/machine/services/machine_service.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    final authService = AuthService();
    final authRepository = AuthRepository(authService: authService);
    final employeeService = EmployeeService();
    final employeeRepository = EmployeeRepository(employeeService: employeeService);
    final machineService = MachineService();
    final machineRepository = MachineRepository(machineService: machineService);
    Get.lazyPut(() => HomeController(
      authRepository: authRepository,
      employeeRepository: employeeRepository,
      machineRepository: machineRepository,
    ));
  }

}