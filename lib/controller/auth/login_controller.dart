import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:home_finder/core/constant/routes.dart';

abstract class LoginController extends GetxController {
  login(String email, String password);
  showPassword();
  goToSignupPage();
}

class LoginControllerImp extends LoginController {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  bool isPasswordVisible = true;

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

  @override
  login(String email, String password) {}

  @override
  goToSignupPage() {
    Get.toNamed(AppRoute.signup);
  }
}
