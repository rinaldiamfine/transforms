import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transforms/arguments.dart';
import 'package:transforms/features/authentication/repositories/auth_repository.dart';
import 'package:transforms/features/employee/repositories/employee_repository.dart';
import 'package:transforms/features/machine/repositories/machine_repository.dart';
import 'package:transforms/models/machine_model.dart';
import 'package:transforms/models/user_model.dart';
import 'package:transforms/routes/routes.dart';
import 'package:transforms/tools/enum.dart';

class HomeController extends GetxController with StateMixin {
  Rx<UserModel> userModel = UserModel(
    photo: '',
    name: '',
    id: '',
    role: UserRole.Admin,
  ).obs;
  TextEditingController searchController = TextEditingController();
  FocusNode searchFocusNode = FocusNode();
  var currentSegment = HomeSegmentType.machine.obs;

  RxList<MachineModel> machines = RxList.empty();
  RxList<UserModel> employees = RxList.empty();
  RxList<MachineModel> fileteredMachines = RxList.empty();
  RxList<UserModel> filteredEmployees = RxList.empty();

  final MachineRepository _machineRepository;
  final AuthRepository _authRepository;
  final EmployeeRepository _employeeRepository;
  HomeController({
      required MachineRepository machineRepository,
      required AuthRepository authRepository,
      required EmployeeRepository employeeRepository,
    }) : 
      _machineRepository = machineRepository,
      _authRepository = authRepository,
      _employeeRepository = employeeRepository;

  fecthUserData() {
    try {
      userModel = _authRepository.getUserProfileFromStorage().obs;
      _employeeRepository.getEmployees(UserRole.Admin).then((value) {
        employees.value = value.employee;
      });
      _machineRepository.getMachine(1).then((value) {
        machines.value = value.machines;
      });
    } catch (e) {
      print("ERROR ${e}");
    } finally {
      update();
    }
  }

  @override
  void onInit() {
    super.onInit();
    change(null, status: RxStatus.loading());
    fecthUserData();
    fileteredMachines = machines;
    filteredEmployees = employees;
    Future.delayed(const Duration(seconds: 2)).then((value) {
      change(null, status: RxStatus.success());
    });
    update();
  }

  void filterModel({required String name}) {
    if (currentSegment.value == HomeSegmentType.machine) {
      RxList<MachineModel> filteredData = RxList.empty();
      for (var i in machines) {
        if (i.type.name.toLowerCase().contains(name.toLowerCase())) {
          filteredData.add(i);
        }
      }
      fileteredMachines = filteredData;
    } else if (currentSegment.value == HomeSegmentType.employee) {
      RxList<UserModel> filteredData = RxList.empty();
      for (var i in employees) {
        if (i.name.toLowerCase().contains(name.toLowerCase())) {
          filteredData.add(i);
        }
      }
      filteredEmployees = filteredData;
    }
    update();
  }

  void createTask() {
    Get.toNamed(
      AppRoutes.task,
      arguments: TaskArgument(
        title: "Formulir Pemeliharaan", 
        accessType: AccessType.create, 
        id: 0,
        userModel: userModel.value
      )
    );
  }

  void createEmploye() {
    Get.toNamed(
      AppRoutes.employee,
      arguments: EmployeeArgument(
        title: "Buat User", 
      )
    );
  }

  void viewMachine({required MachineModel machine}) {
    Get.toNamed(
      AppRoutes.machineDetail,
      arguments: MachineDetailArgument(model: machine)
    );
  }

  void viewEmployee({required int employeeId}) {
    Get.toNamed(
      AppRoutes.machineDetail
    );
  }

}