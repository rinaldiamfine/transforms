import 'dart:convert';
import 'package:transforms/features/employee/models/employee_model.dart';
import 'package:transforms/tools/configuration.dart';
import 'package:transforms/tools/connection.dart';
import 'package:transforms/tools/enum.dart';
import 'package:transforms/tools/exception.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as p;

class EmployeeService {
  final _connection = APIConnection(
    alice: ConfigEnvironments.getEnvironments()['alice']
  );

  String get _employeePrefix => 'user';
  String employeePrefixByRole(UserRole role) {
    return p.join(_employeePrefix, role.name.toLowerCase());
  }
  
  Future<DefaultEmployeeResponseModel> createEmployee() async {
    try {
      final response = await _connection.request(
        endpoint: _employeePrefix,
        
        method: RequestMethod.POST
      );
      return DefaultEmployeeResponseModel.fromJson(jsonDecode(response.body));
    } catch (err) {
      throw DefaultException(message: err.toString());
    }
  }


  Future<EmployeeResponseModel> getEmployees(
    UserRole role,
  ) async {
    try {
      final response = await _connection.request(
        endpoint: employeePrefixByRole(role),
        method: RequestMethod.GET
      );
      return EmployeeResponseModel.fromJson(jsonDecode(response.body));
    } catch (err) {
      throw DefaultException(message: err.toString());
    }
  }
}
