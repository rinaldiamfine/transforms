import 'package:get/get.dart';
import 'package:transforms/controllers.dart';

class TaskReasonBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TaskReasonController(
      
    ));
  }

}