import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_finder/core/constant/routes.dart';
import 'package:intl_phone_field/phone_number.dart';

abstract class SignUpController extends GetxController {
  signUp(String email, String password);
  showPassword();
  showConfirmPassword();
  phoneCompleteNumber(PhoneNumber phone);
  goToLoginPage();
}

class SignUpControllerImp extends SignUpController {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  late TextEditingController phoneController;
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  bool isPasswordVisible = true;
  bool isConfirmPasswordVisible = true;

  @override
  showPassword() {
    isPasswordVisible = isPasswordVisible ? false : true;
    update();
  }

  @override
  showConfirmPassword() {
    isConfirmPasswordVisible = isConfirmPasswordVisible ? false : true;
    update();
  }

  @override
  signUp(String email, String password) {}

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    phoneController = TextEditingController();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    super.onClose();
  }

  @override
  phoneCompleteNumber(PhoneNumber phone) {
    print(phone.completeNumber);
  }

  @override
  goToLoginPage() {
    Get.offNamed(AppRoute.login);
  }
}
