// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:foodie/config/themes/theme.dart';
import 'package:foodie/modules/features/sign-in/controllers/auth_controller.dart';
import 'package:foodie/modules/features/sign-in/view/ui/signin_page.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:get_storage/get_storage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController controller = Get.find<AuthController>();
    final box = GetStorage();

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              width: double.infinity,
              height: 70,
              padding: EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(30),
                ),
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Pencarian',
                  hintStyle: primaryTextStyle.copyWith(
                    color: greyColor,
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: primaryColor,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: primaryColor,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: primaryColor,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${controller.nama}'),
                  SizedBox(
                    height: 12,
                  ),
                  Text('${controller.email}'),
                  SizedBox(
                    height: 10,
                  ),
                  Text(controller.readToken()),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.signOutFromGoogle();
          Get.to(SignInPage());
        },
        child: Icon(Icons.logout),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: blackColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: backgroundColor,
            ),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.food_bank,
              color: greyColor,
            ),
            label: 'Pesanan',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: greyColor,
            ),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}
