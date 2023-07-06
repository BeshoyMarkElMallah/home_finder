import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_finder/core/constant/routes.dart';
import 'package:home_finder/core/services/services.dart';

abstract class SplashController extends GetxController {
  redirect();
}

class SplashControllerImp extends SplashController {
  MyServices myServices = Get.find();

  @override
  redirect() {
    if (myServices.sharedPreferences.getString('step') == "2") {
      return AppRoute.homepage;
    }

    //  not logged in
    if (myServices.sharedPreferences.getString('step') == "1") {
      return AppRoute.login;
    }
    return AppRoute.login;
  }
}
