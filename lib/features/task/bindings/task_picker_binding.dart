import 'package:get/get.dart';
import 'package:transforms/controllers.dart';
import 'package:transforms/features/employee/repositories/employee_repository.dart';
import 'package:transforms/features/employee/services/employee_service.dart';
import 'package:transforms/features/machine/repositories/machine_repository.dart';
import 'package:transforms/features/machine/services/machine_service.dart';

class TaskPickerBinding implements Bindings {
  @override
  void dependencies() {
    final employeeService = EmployeeService();
    final employeeRepository = EmployeeRepository(employeeService: employeeService);
    final machineService = MachineService();
    final machineRepository = MachineRepository(machineService: machineService);
    Get.lazyPut(() => TaskPickerController(
      machineRepository: machineRepository, 
      employeeRepository: employeeRepository
    ));
  }

}