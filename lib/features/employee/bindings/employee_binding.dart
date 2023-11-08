import 'package:get/get.dart';
import 'package:transforms/controllers.dart';
import 'package:transforms/features/employee/repositories/employee_repository.dart';
import 'package:transforms/features/employee/services/employee_service.dart';

class EmployeeBinding extends Bindings {
  @override
  void dependencies() {
    final employeeService = EmployeeService();
    final employeeRepository = EmployeeRepository(employeeService: employeeService);
    Get.lazyPut(() => EmployeeController(
      employeeRepository: employeeRepository,
    ));
  }

}