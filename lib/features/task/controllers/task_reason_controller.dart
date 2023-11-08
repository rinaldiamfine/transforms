import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transforms/arguments.dart';
import 'package:transforms/controllers.dart';
import 'package:transforms/models/task_line_model.dart';
import 'package:transforms/tools/enum.dart';

class TaskReasonController extends GetxController {
  TaskReasonArgument arguments = Get.arguments;

  TextEditingController productNameController = TextEditingController();
  FocusNode productNameFocusNode = FocusNode();
  TextEditingController quantityController = TextEditingController();
  FocusNode quantityFocusNode = FocusNode();
  TextEditingController reasonController = TextEditingController();
  FocusNode reasonFocusNode = FocusNode();

  RxBool isProductNameValid = false.obs;
  RxBool isQuantityValid = false.obs;
  RxBool isReasonValid = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void inputTextValidator({required TextEditingController controller, required RxBool status}) {
    if (controller.text.isNotEmpty) {
      status.value = true;

    } else {
      status.value = false;
    }
    buttonValidator();
    update();
  }

  bool buttonValidator() {
    if (arguments.type == MaintenanceType.ChangePart) {
      if (productNameController.text.isNotEmpty && quantityController.text.isNotEmpty && reasonController.text.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } else {
      // For type Fixing or Others
      if (reasonController.text.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    }
  }

  void save() {
    TaskController taskController = Get.find<TaskController>();
    taskController.taskLines.add(
      TaskLineModel(
        id: arguments.model.id, 
        taskId: arguments.model.taskId, 
        type: arguments.type,
        message: reasonController.text,
        quantity: double.tryParse(quantityController.text),
        productName: productNameController.text
      )
    );
    taskController.update();
    Get.back();
  }
}