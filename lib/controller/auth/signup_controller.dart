import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SignUpController extends GetxController {
  signUp(String email, String password);
  // showPassword();
}

class SignUpControllerImp extends SignUpController {
  @override
  signUp(String email, String password) {}
}
