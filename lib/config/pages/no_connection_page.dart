// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:foodie/config/themes/theme.dart';
import 'package:foodie/modules/features/home/view/ui/home_page.dart';
import 'package:foodie/modules/features/sign-in/view/ui/signin_page.dart';
import 'package:foodie/modules/global_controllers/connection_controller.dart';
import 'package:get/get.dart';

class NoConnectionPage extends StatefulWidget {
  const NoConnectionPage({super.key});

  @override
  State<NoConnectionPage> createState() => _NoConnectionPageState();
}

class _NoConnectionPageState extends State<NoConnectionPage> {
  @override
  Widget build(BuildContext context) {
    ConnectionManagerController controller =
        Get.find<ConnectionManagerController>();
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              'assets/images/bg_find_location.png',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  'assets/images/ic_logo.png',
                  width: 200,
                  height: 90,
                ),
                Column(
                  children: [
                    Icon(
                      Icons.signal_wifi_off,
                      color: greyColor,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      'Koneksi anda terputus',
                      style: primaryTextStyle.copyWith(
                        color: greyColor,
                        fontWeight: semiBold,
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.connectionType.value = 1;
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 20,
                    ),
                    child: Text('Kembali'),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
