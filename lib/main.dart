import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:foodie/config/pages/no_connection_page.dart';
import 'package:foodie/modules/features/find-location/controllers/find_location_controller.dart';
import 'package:foodie/modules/features/main/controllers/main_controller.dart';
import 'package:foodie/modules/features/sign-in/controllers/auth_controller.dart';
import 'package:foodie/modules/features/sign-in/view/ui/signin_page.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'modules/global_bindings/controller_binding.dart';
import 'modules/global_controllers/connection_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ConnectionManagerController());
    Get.put(AuthController());
    Get.put(FindLocationController());
    Get.put(HomeController());
    return GetMaterialApp(
      initialBinding: ControllerBinding(),
      debugShowCheckedModeBanner: false,
      home: SignInPage(),
    );
  }
}
