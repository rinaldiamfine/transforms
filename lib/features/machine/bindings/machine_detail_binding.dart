import 'package:get/get.dart';
import 'package:transforms/controllers.dart';

class MachineDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MachineDetailController(
        // authRepository: Get.find<AuthRepository>(), 
        // addressRepository: Get.find<ProfileAddressRepository>()
    ));
  }

}