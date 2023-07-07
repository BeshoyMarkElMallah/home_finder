import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:home_finder/controller/splash_controller.dart';
import 'package:home_finder/core/constant/imageasset.dart';
import 'package:home_finder/core/constant/routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SplashControllerImp());
    Timer(
        const Duration(seconds: 2), () => Get.offNamed(controller.redirect()));
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF1755B3),
              Color(0xFF6D1FAA),
              Color(0xFF8A30C1),
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Center(
          child: Image.asset(Assets.assetsImagesLogo),
        ),
      ),
    );
  }
}
