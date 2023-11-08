import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:transforms/features/authentication/repositories/auth_repository.dart';
import 'package:transforms/models/user_model.dart';
import 'package:transforms/routes/routes.dart';
import 'package:transforms/tools/helper.dart';

class ProfileController extends GetxController with StateMixin {
  Rx<UserModel>? userModel;

  final AuthRepository _authRepository;
  ProfileController({
      required AuthRepository authRepository,
    }) : 
      _authRepository = authRepository;

  @override
  void onInit() {
    super.onInit();
    fecthUserData();
  }

  fecthUserData() {
    change(null, status: RxStatus.loading());
    try {
      userModel = _authRepository.getUserProfileFromStorage().obs;
    } catch (e) {
      change(null, status: RxStatus.error());
    } finally {
      change(null, status: RxStatus.success());
    }
  }

  void logout() {
    final storage = Get.find<GetStorage>();
    storage.erase();
    Get.offAllNamed(AppRoutes.login);
    
    // CustomLoadingCircular(Get.context!).stopLoading();
    // _authRepository.logout().then((value) {
    //   CustomLoadingCircular(Get.context!).stopLoading();
    //   final storage = Get.find<GetStorage>();
    //   storage.erase();
    //   Get.offAllNamed(AppRoutes.login);
    // }).onError((error, stackTrace) {
    //   CustomLoadingCircular(Get.context!).stopLoading();
    // });
  }

  void viewSetting() {
    Get.toNamed(AppRoutes.profileSetting);
  }
}