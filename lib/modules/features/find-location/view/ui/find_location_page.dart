// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:foodie/config/themes/theme.dart';
import 'package:foodie/modules/features/find-location/controllers/find_location_controller.dart';
import 'package:foodie/modules/features/main/view/ui/main_page.dart';
import 'package:get/get.dart';

class FindLocationPage extends StatefulWidget {
  const FindLocationPage({super.key});

  @override
  State<FindLocationPage> createState() => _FindLocationPageState();
}

class _FindLocationPageState extends State<FindLocationPage> {
  FindLocationController controller = Get.find<FindLocationController>();

  @override
  void initState() {
    super.initState();
    _getLocation().then((value) {
      Future.delayed(
        Duration(seconds: 3),
        (() => Get.off(
              MainPage(),
            )),
      );
    });
  }

  Future _getLocation() async {
    await controller.getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Icon(Icons.location_on),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height - 100,
                margin: EdgeInsets.only(top: 50),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/bg_find_location.png',
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  Text(
                    'Mencari Lokasimu ...',
                    style: primaryTextStyle.copyWith(
                      fontSize: 22,
                      color: greyColor,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Image.asset(
                    'assets/images/ic_find_location.png',
                    width: 190,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 40 * 2,
                    child: Text(
                      controller.address.value,
                      style: primaryTextStyle.copyWith(
                        fontSize: 20,
                        fontWeight: semiBold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
