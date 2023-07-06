import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_finder/routes.dart';
import 'package:home_finder/core/services/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Home Finder',
      getPages: routes,
    );
  }
}
