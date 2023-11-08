import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transforms/features/employee/arguments/employee_argument.dart';
import 'package:transforms/features/employee/repositories/employee_repository.dart';
import 'package:transforms/tools/enum.dart';

class UserRoleModel {
  int id;
  String name;
  UserRole role;

  UserRoleModel({required this.id, required this.name, required this.role});
}

class EmployeeController extends GetxController {
  EmployeeArgument arguments = Get.arguments;

  TextEditingController idController = TextEditingController();
  FocusNode idFocusNode = FocusNode();
  TextEditingController nameController = TextEditingController();
  FocusNode nameFocusNode = FocusNode();
  TextEditingController phoneController = TextEditingController();
  FocusNode phoneFocusNode = FocusNode();
  TextEditingController passwordController = TextEditingController();
  FocusNode passwordFocusNode = FocusNode();

  List<UserRoleModel> roles = List.empty();
  Rxn<UserRoleModel> selectedUserRoles = Rxn();

  final EmployeeRepository _employeeRepository;
  EmployeeController({
      required EmployeeRepository employeeRepository,
    }) : 
      _employeeRepository = employeeRepository;

  @override
  void onInit() {
    super.onInit();
    roles = [
      UserRoleModel(id: 0, name: "Teknisi", role: UserRole.Technician),
      UserRoleModel(id: 1, name: "Admin", role: UserRole.Admin),
    ];
    selectedUserRoles.value = roles.first;
  }

  void createUser() {
    print("create user");
  }

}