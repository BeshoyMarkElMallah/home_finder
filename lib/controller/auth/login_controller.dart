import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  // login(String email, String password);
  showPassword();
}

class LoginControllerImp extends LoginController {
  // @override
  // login(String email, String password) {}
  late TextEditingController emailController;
  late TextEditingController passwordController;
  bool isPasswordVisible = false;

  @override
  showPassword() {
    isPasswordVisible = isPasswordVisible ? false : true;
    update();
  }

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
