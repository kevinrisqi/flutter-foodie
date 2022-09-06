// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:foodie/config/pages/no_connection_page.dart';
import 'package:foodie/modules/features/sign-in/view/ui/signin_page.dart';
import 'package:get/get.dart';
import 'modules/global_bindings/controller_binding.dart';
import 'modules/global_controllers/connection_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ConnectionManagerController());
    final ConnectionManagerController controller = Get.find();
    return GetMaterialApp(
      initialBinding: ControllerBinding(),
      debugShowCheckedModeBanner: false,
      home: Obx(() => controller.connectionType == 1 ? SignInPage() : NoConnectionPage()),
    );
  }
}
