import 'package:flutter/material.dart';
import 'package:flutter_alice/alice.dart';
import 'package:get/get.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:transforms/initializer.dart';
import 'package:transforms/routes/navigations.dart';
import 'package:transforms/routes/routes.dart';
import 'package:transforms/tools/configuration.dart';
import 'package:timeago/timeago.dart' as timeago;


Future<void> main() async {

  timeago.setLocaleMessages('id', timeago.IdMessages());

  await Initializer.init();
  final initialRoute = await AppRoutes.initialRoute;
  final env = ConfigEnvironments.getEnvironments();
  runApp(
    MainApp(
      initialRoute: initialRoute,
      isDebug: env['is_debug'],
      alice: env['alice']
    )
  );
}

class MainApp extends StatelessWidget {
  final String initialRoute;
  final Alice alice;
  final bool isDebug;
  const MainApp({super.key, required this.initialRoute, required this.alice, required this.isDebug});

  @override
  Widget build(BuildContext context) {
    return isDebug ? OverlaySupport.global(
      child: GetMaterialApp(
        navigatorKey: alice.getNavigatorKey(),
        title: 'Zahdu',
        initialRoute: initialRoute,
        getPages: Navigations.routes,
        defaultTransition: Transition.noTransition,
        debugShowCheckedModeBanner: isDebug,
      ), 
    ) : GetMaterialApp(
        navigatorKey: Get.key,
        title: 'Zahdu',
        initialRoute: initialRoute,
        getPages: Navigations.routes,
        defaultTransition: Transition.noTransition,
        debugShowCheckedModeBanner: isDebug,
      );
  }
}
