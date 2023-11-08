import 'package:transforms/features/employee/models/employee_model.dart';
import 'package:transforms/features/employee/services/employee_service.dart';
import 'package:transforms/tools/enum.dart';

class EmployeeRepository {
  final EmployeeService _employeeService;

  EmployeeRepository({
    required EmployeeService employeeService,
  }) : _employeeService = employeeService;

  Future<EmployeeResponseModel> getEmployees(
      UserRole role) async {
    try {
      final response = await _employeeService.getEmployees(
        role
      );
      return response;
    } catch (err) {
      rethrow;
    }
  }
}
