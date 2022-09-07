// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:foodie/config/pages/no_connection_page.dart';
import 'package:foodie/modules/features/sign-in/controllers/auth_controller.dart';
import 'package:foodie/modules/features/sign-in/view/ui/signin_page.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'modules/global_bindings/controller_binding.dart';
import 'modules/global_controllers/connection_controller.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ConnectionManagerController());
    Get.put(AuthController());
    final ConnectionManagerController controller =
        Get.find<ConnectionManagerController>();
    return Obx(
      () => GetMaterialApp(
        initialBinding: ControllerBinding(),
        debugShowCheckedModeBanner: false,
        home: controller.connectionType.value == 1 ||
                controller.connectionType.value == 2
            ? SignInPage()
            : NoConnectionPage(),
      ),
    );
  }
}
