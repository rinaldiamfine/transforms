import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transforms/arguments.dart';
import 'package:transforms/features/employee/repositories/employee_repository.dart';
import 'package:transforms/features/machine/repositories/machine_repository.dart';
import 'package:transforms/features/task/controllers/task_controller.dart';
import 'package:transforms/models/picker_model.dart';
import 'package:transforms/tools/enum.dart';

class TaskPickerController extends GetxController with StateMixin {
  TaskPickerArgument arguments = Get.arguments;
  RxList<PickerModel> filterModels = RxList.empty();
  RxList<PickerModel> models = RxList.empty();
  late PickerModel model;

  TextEditingController searchController = TextEditingController();
  FocusNode searchFocusNode = FocusNode();


  final MachineRepository _machineRepository;
  final EmployeeRepository _employeeRepository;
  TaskPickerController({
      required MachineRepository machineRepository,
      required EmployeeRepository employeeRepository,
    }) : 
      _machineRepository = machineRepository,
      _employeeRepository = employeeRepository;

  void onSelect(PickerModel model) {
    TaskController taskController = Get.find<TaskController>();
    if (arguments.type == PickerType.machine) {
      taskController.machine = model;
    } else if (arguments.type == PickerType.employee) {
      taskController.employee = model;
    }
    taskController.update();
    Get.back();
  }

  void fetchDataPicker() {
    change(null, status: RxStatus.loading());
    model = arguments.model;
    if (arguments.type == PickerType.machine) {
      _machineRepository.getMachine(1).then((value) {
        models.value = List<PickerModel>.from(value.machines.map((e) {
          return PickerModel(id: e.id, name: e.type.name);
        }));
        filterModels = models;
        change(null, status: RxStatus.success());
        if (models.isEmpty) {
          change(null, status: RxStatus.empty());
        }
      }).onError((error, stackTrace) {
        change(null, status: RxStatus.error());
      });
    } else if (arguments.type == PickerType.employee) {
      _employeeRepository.getEmployees(UserRole.Admin).then((value) {
        models.value = List<PickerModel>.from(value.employee.map((e) {
          return PickerModel(
            id: e.id, 
            name: e.id,
            subtitle: e.name
          );
        }));
        filterModels = models;
        change(null, status: RxStatus.success());
        if (models.isEmpty) {
          change(null, status: RxStatus.empty());
        }
      }).onError((error, stackTrace) {
        change(null, status: RxStatus.error());
      });
    }
    update();
  }

  void filterModel({required String name}) {
    RxList<PickerModel> filteredData = RxList.empty();
    for (var i in models) {
      if (i.name.toLowerCase().contains(name.toLowerCase())) {
        filteredData.add(i);
      }
    }
    filterModels = filteredData;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    fetchDataPicker();
  }
}