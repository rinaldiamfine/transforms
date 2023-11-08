import 'package:flutter_alice/alice.dart';
import 'package:get/get.dart';

int limitRequestTimeout = 5;
bool isDebug = true;
String appLocale = 'id';

class Environments {
  static const String production = 'prod';
  static const String dev = 'dev';
  static const String local = 'local';
}

class ConfigEnvironments {
  static const String currentEnvironments = Environments.dev;
  /// remember to change environment every you build
  static final List<Map<String, dynamic>> availableEnvironments = [
    {
      'env': Environments.local,
      'url': 'http://localhost:8080/api/',
      'is_debug': true,
      'alice': Alice(
        showNotification: true,
        showInspectorOnShake: true,
        navigatorKey: Get.key
      )
    },
    {
      'env': Environments.dev,
      'url': 'https://81ea-180-242-192-206.ngrok-free.app',
      'is_debug': true,
      'alice': Alice(
        showNotification: true,
        showInspectorOnShake: true,
        navigatorKey: Get.key
      )
    },
    {
      'env': Environments.production,
      'url': '',
      'is_debug': false,
      'alice': Alice(
        showNotification: false,
        showInspectorOnShake: false,
        navigatorKey: Get.key
      )
    },
  ];

  static Map<String, dynamic> getEnvironments() {
    return availableEnvironments.firstWhere(
      (d) {
        return d['env'] == currentEnvironments;
      },
    );
  }
}
