import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transforms/features/authentication/models/auth_model.dart';
import 'package:transforms/features/authentication/repositories/auth_repository.dart';
import 'package:transforms/routes/routes.dart';
import 'package:transforms/tools/helper.dart';

class LoginController extends GetxController {
  final AuthRepository _authRepository;

  TextEditingController usernameController = TextEditingController();
  FocusNode usernameFocusNode = FocusNode();

  TextEditingController passwordController = TextEditingController();
  FocusNode passwordFocusNode = FocusNode();

  LoginController({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  void onInit() {
    usernameController.text = "A-001";
    passwordController.text = "admin123";
    super.onInit();
  }
  
  bool buttonChecker() {
    if (usernameController.text == "" || passwordController.text == "") {
      return false;
    }
    return true;
  }
  
  Future<void> authenticate() async {
    CustomLoadingCircular(Get.context!).startLoading();
    _authRepository.authenticate(
      AuthRequestModel(username: usernameController.text, password: passwordController.text)
    ).then((value) {
      CustomLoadingCircular(Get.context!).stopLoading();
      Get.offAllNamed(AppRoutes.home);
    }).onError((error, stackTrace) {
      CustomLoadingCircular(Get.context!).stopLoading();
    });
  }
}