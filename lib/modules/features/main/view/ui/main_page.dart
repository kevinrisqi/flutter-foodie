// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:foodie/config/pages/no_connection_page.dart';
import 'package:foodie/config/themes/theme.dart';
import 'package:foodie/modules/features/home/view/ui/home_page.dart';
import 'package:foodie/modules/features/main/controllers/main_controller.dart';
import 'package:foodie/modules/features/main/view/components/bottom_navbar.dart';
import 'package:foodie/modules/features/order/view/ui/order_page.dart';
import 'package:foodie/modules/features/profile/view/ui/profile_page.dart';
import 'package:foodie/modules/features/sign-in/controllers/auth_controller.dart';
import 'package:foodie/modules/features/sign-in/view/ui/signin_page.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';

class MainPage extends StatefulWidget {
  MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final MainController cMain = Get.find<MainController>();
  final AuthController controller = Get.find<AuthController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void handleLogout() async {
    await controller.signOutFromGoogle();
    Get.to(SignInPage());
  }

  Widget body() {
    switch (cMain.currentIndex.value) {
      case 0:
        return HomePage();
      case 1:
        return OrderPage();
      case 2:
        return ProfilePage();
      default:
        return HomePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: lightGreyColor,
        body: NoConnectionPage(
          child: SafeArea(
            child: Obx(
              () => body(),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            handleLogout();
          },
          child: Icon(Icons.logout),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        bottomNavigationBar: BottomNarBar());
  }
}
