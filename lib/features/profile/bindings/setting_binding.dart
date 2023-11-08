import 'package:get/get.dart';
import 'package:transforms/controllers.dart';

class SettingBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SettingController(

    ));
  }

}