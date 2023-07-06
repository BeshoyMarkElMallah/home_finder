import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_finder/core/constant/routes.dart';
import 'package:home_finder/core/services/services.dart';

class MyMiddleWare extends GetMiddleware {
  int? get priority => 1;

  MyServices myServices = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    // done login
    if (myServices.sharedPreferences.getString('step') == "2") {
      return const RouteSettings(name: AppRoute.homepage);
    }

    //  not logged in
    if (myServices.sharedPreferences.getString('step') == "1") {
      return const RouteSettings(name: AppRoute.login);
    }
  }
}
