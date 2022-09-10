// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:foodie/config/pages/no_connection_page.dart';
import 'package:foodie/config/themes/theme.dart';
import 'package:foodie/modules/features/home/view/ui/home_page.dart';
import 'package:foodie/modules/features/main/controllers/main_controller.dart';
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
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        child: BottomAppBar(
          child: BottomNavigationBar(
            backgroundColor: blackColor,
            onTap: (value) {
              cMain.currentIndex.value = value;
              print(cMain.currentIndex);
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 25,
                  color: backgroundColor,
                ),
                label: 'Beranda',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/images/ic_order.png',
                  width: 32,
                ),
                label: 'Pesanan',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/images/ic_user.png',
                  width: 20,
                ),
                label: 'Profil',
              ),
            ],
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
          ),
        ),
      ),
    );
  }
}
