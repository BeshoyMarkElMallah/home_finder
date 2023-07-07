import 'package:get/get.dart';
import 'package:home_finder/core/constant/routes.dart';
import 'package:home_finder/core/middleware/mymiddleware.dart';
import 'package:home_finder/view/screen/auth/login_screen.dart';
import 'package:home_finder/view/screen/screens.dart';

List<GetPage> routes = [
  GetPage(
    name: "/",
    page: () => const SplashScreen(),
  ),
  GetPage(
    name: AppRoute.login,
    page: () => const LoginScreen(),
  ),
  GetPage(
    name: AppRoute.signup,
    page: () => const SignUpScreen(),
  ),
];
