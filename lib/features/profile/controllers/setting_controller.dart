import 'package:get/get.dart';
import 'package:transforms/tools/app_info.dart';

class SettingController extends GetxController with StateMixin {
  AppInfo? appInfo;

  @override
  Future<void> onInit() async {
    await deviceInfo();
    super.onInit();
  }

  Future<void> deviceInfo() async {
    appInfo = await AppInfo.getInfo();
    update();
  }
}