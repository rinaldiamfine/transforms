import 'package:get/get.dart';
import 'package:transforms/bindings.dart';
import 'package:transforms/routes/routes.dart';
import 'package:transforms/screens.dart';

class Navigations {
  static List<GetPage> routes = [
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginScreen(),
      binding: LoginBinding()
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeScreen(),
      binding: HomeBinding()
    ),

    // Profile
    GetPage(
      name: AppRoutes.profile,
      page: () => const ProfileScreen(),
      binding: ProfileBinding()
    ),
    GetPage(
      name: AppRoutes.profileSetting,
      page: () => const SettingScreen(),
      binding: SettingBinding()
    ),

    // Task
    GetPage(
      name: AppRoutes.task,
      page: () => const TaskScreen(),
      binding: TaskBinding()
    ),
    GetPage(
      name: AppRoutes.taskPicker,
      page: () => const TaskPickerScreen(),
      binding: TaskPickerBinding()
    ),
    GetPage(
      name: AppRoutes.taskReason,
      page: () => const TaskReasonScreen(),
      binding: TaskReasonBinding()
    ),

    GetPage(
      name: AppRoutes.machineDetail,
      page: () => const MachineDetailScreen(),
      binding: MachineDetailBinding()
    ),
    
    GetPage(
      name: AppRoutes.employee,
      page: () => const EmployeeScreen(),
      binding: EmployeeBinding()
    ),
  ];
}