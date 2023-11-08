import 'dart:convert';
import 'dart:io';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';

class AppInfo {
  late String? appName;
  late String? packageName;
  late String? version;
  late String? buildNumber;
  late String? deviceInfo;

  AppInfo(
    {this.appName,
    this.packageName,
    this.version,
    this.buildNumber,
    this.deviceInfo}
  );

  static Future<AppInfo> getInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    DeviceInfoPlugin info = DeviceInfoPlugin();

    String? deviceInfo = "";
    if (Platform.isAndroid) {
      deviceInfo = (await info.androidInfo).model;
    }
    if (Platform.isIOS) {
      deviceInfo = (await info.iosInfo).utsname.machine;
    }
    return AppInfo(
      appName: packageInfo.appName,
      packageName: packageInfo.packageName,
      version: packageInfo.version,
      buildNumber: packageInfo.buildNumber,
      deviceInfo: deviceInfo,
    );
  }

  @override
  String toString() {
    final Map<String, dynamic> data = {
      "appName": appName,
      "packageName": packageName,
      "version": version,
      "buildNumber": buildNumber,
      "deviceInfo": deviceInfo,
    };
    return jsonEncode(data);
  }
}
