import 'package:get/get.dart';
import 'package:transforms/controllers.dart';

class TaskBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TaskController(
      
    ));
  }

}