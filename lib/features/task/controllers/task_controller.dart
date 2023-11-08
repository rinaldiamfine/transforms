import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transforms/arguments.dart';
import 'package:transforms/models/maintenance_type_model.dart';
import 'package:transforms/models/picker_model.dart';
import 'package:transforms/models/task_line_model.dart';
import 'package:transforms/routes/routes.dart';
import 'package:transforms/tools/enum.dart';
import 'package:transforms/widgets/custom_dialog_widget.dart';

class TaskController extends GetxController with StateMixin {
  CustomDialogWidget customDialog = CustomDialogWidget();
  TaskArgument arguments = Get.arguments;
  PickerModel employee = PickerModel(id: "", name: "Pilih Teknisi", subtitle: "No.");
  PickerModel machine = PickerModel(id: "", name: "Pilih Mesin");

  TextEditingController nameController = TextEditingController();
  FocusNode nameFocusNode = FocusNode();
  TextEditingController noteController = TextEditingController();
  FocusNode noteFocusNode = FocusNode();

  List<MaintenanceTypeModel> maintenanceTypes = List.empty();
  Rxn<MaintenanceTypeModel> selectedMaintenanceType = Rxn<MaintenanceTypeModel>();

  RxList<TaskLineModel> taskLines = RxList.empty();

  RxBool isMachineValid = false.obs;
  RxBool isNameValid = false.obs;

  // Temp - only for modal
  // TextEditingController productNameController = TextEditingController();
  // FocusNode productNameFocusNode = FocusNode();
  // TextEditingController quantityController = TextEditingController();
  // FocusNode quantityFocusNode = FocusNode();
  // TextEditingController reasonController = TextEditingController();
  // FocusNode reasonFocusNode = FocusNode();

  @override
  void onInit() {
    super.onInit();
    maintenanceTypes = [
      MaintenanceTypeModel(id: 0, name: "Perbaikan", type: MaintenanceType.Fixing),
      MaintenanceTypeModel(id: 1, name: "Ganti Suku Cadang", type: MaintenanceType.ChangePart),
      MaintenanceTypeModel(id: 2, name: "Lainnya", type: MaintenanceType.Others)
    ];
    selectedMaintenanceType.value = maintenanceTypes.first;
    employee = PickerModel(
      id: arguments.userModel.id, 
      name: arguments.userModel.id,
      subtitle: arguments.userModel.name
    );
    update();
  }

  void pickerValidator(PickerModel picker, RxBool status) {
    if (picker.id == 0) {
      status.value = false;
    } else {
      status.value = true;
    }
  }
  void validateName({String? name}) {
    if (name == "") {
      isNameValid(false);
    } else if (name == null) {
      isNameValid(false);
    } else {
      isNameValid(true);
    }
  }

  void pickerMachine() {
    Get.toNamed(
      AppRoutes.taskPicker,
      arguments: TaskPickerArgument(
        title: "Pilih Mesin",
        model: machine,
        type: PickerType.machine
      )
    );
  }

  void pickerEmployee() {
    Get.toNamed(
      AppRoutes.taskPicker,
      arguments: TaskPickerArgument(
        title: "Pilih Teknisi",
        model: employee,
        type: PickerType.employee
      )
    );
  }

  void changeMaintenanceType(String? value) {
    if (value != null) {
      var selected = maintenanceTypes.where((element) {
        return element.id == int.parse(value);
      },);
      if (selected.isNotEmpty) {
        selectedMaintenanceType.value = selected.first;
      }
    }
    update();
  }

  void addMaintenanceReason({int? taskId}) {
    Get.toNamed(
      AppRoutes.taskReason,
      arguments: TaskReasonArgument(
        title: "Alasan Pemeliharaan", 
        type: selectedMaintenanceType.value!.type, 
        model: TaskLineModel(
          id: arguments.id, 
          type: selectedMaintenanceType.value!.type,
          taskId: taskId ?? 0, 
          message: ""
        ),
      )
    );
  }
}