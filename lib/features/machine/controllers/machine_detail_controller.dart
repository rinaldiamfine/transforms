import 'package:get/get.dart';
import 'package:transforms/arguments.dart';
import 'package:transforms/models/machine_model.dart';

class MachineDetailController extends GetxController with StateMixin {
  MachineDetailArgument arguments = Get.arguments;
  Rxn<MachineDetailModel> machineDetail = Rxn();
  
  @override
  void onInit() {
    super.onInit();
  }
}