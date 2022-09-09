// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:foodie/config/pages/no_connection_page.dart';
import 'package:foodie/modules/features/find-location/view/ui/find_location_page.dart';
import 'package:foodie/modules/features/sign-in/controllers/auth_controller.dart';
import 'package:foodie/modules/features/sign-in/view/components/header.dart';
import 'package:foodie/modules/global_controllers/connection_controller.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:get_storage/get_storage.dart';

import '../../../home/view/ui/home_page.dart';
import '../components/content.dart';

class SignInPage extends StatefulWidget {
  SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final ConnectionManagerController controller =
      Get.find<ConnectionManagerController>();

  @override
  void initState() {
    validateUser();
    controller.connectionType.value;
    super.initState();
  }

  void validateUser() async {
    final box = GetStorage();
    bool isLogged = await box.read('isLogged') ?? false;
    if (isLogged) {
      Get.to(HomePage());
    } else {
      Get.to(SignInPage());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NoConnectionPage(
        child: Container(
          margin: EdgeInsets.only(
            left: 46,
            right: 46,
          ),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Header(),
                  Content(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
