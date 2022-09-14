import 'package:flutter/material.dart';
import 'package:foodie/config/themes/theme.dart';
import 'package:foodie/modules/features/main/controllers/main_controller.dart';
import 'package:foodie/modules/features/sign-in/controllers/auth_controller.dart';
import 'package:get/get.dart';

class BottomNarBar extends StatelessWidget {
  const BottomNarBar({super.key});

  @override
  Widget build(BuildContext context) {
    final MainController cMain = Get.find<MainController>();
    final AuthController controller = Get.find<AuthController>();
    return ClipRRect(
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
    );
  }
}
